import {firestore, https, Change, ParamsOf} from "firebase-functions/v2"
import * as admin from "firebase-admin"
import * as logger from "firebase-functions/logger"

// Helper paths for user collections (similar to stripe.ts)
const userSubscriptionEventsPath = (uid: string) => `users/${uid}/subscription_events`
const userSubscriptionInfoPath = (uid: string) => `users/${uid}/subscription_info`
const revenueCatCustomerLookupPath = (customerId: string) => `revenuecat_customer_user_lookup/${customerId}`
const latestSubscriptionEventPath = (uid: string) => `latest_subscription_events/${uid}`

/// Helper function to find the uid from the RevenueCat customer ID
const lookupUserByCustomerId = async (firestore: FirebaseFirestore.Firestore, customerId: string) => {
  const docRef = firestore.doc(revenueCatCustomerLookupPath(customerId))
  const doc = await docRef.get()
  const data = doc.data()
  return data?.uid
}

/// Map RevenueCat subscription events to user-specific collections (similar to onStripePaymentWritten)
export async function onRevenueCatEventWritten(
  event: firestore.FirestoreEvent<Change<firestore.DocumentSnapshot> | undefined, ParamsOf<string>>
) {
  const eventId = event.params.eventId
  const firestore = admin.firestore()
  const doc = event.data?.after.data()
  
  if (doc === undefined) {
    logger.info(`RevenueCat event ${eventId} was deleted`)
    return
  }

  const {
    app_user_id,
    customer_id,
    event_type,
    product_id,
    period_type,
    entitlements,
    price,
    currency,
    platform
  } = doc

  // Use app_user_id directly (this should be Firebase UID due to our sync)
  const uid = app_user_id || await lookupUserByCustomerId(firestore, customer_id)
  
  if (!uid) {
    logger.error(`Could not find uid for customer_id: ${customer_id}`)
    return
  }

  // Map event to user's subscription_events collection
  await firestore.doc(`${userSubscriptionEventsPath(uid)}/${eventId}`).set({
    id: eventId,
    eventType: event_type,
    customerId: customer_id,
    appUserId: app_user_id,
    productId: product_id || null,
    periodType: period_type || null,
    price: price || null,
    currency: currency || null,
    entitlements: entitlements || {},
    platform: platform,
    timestamp: admin.firestore.FieldValue.serverTimestamp(),
    originalData: doc, // Keep original data for reference
  })

  // Update user's subscription info with latest entitlements
  await updateUserSubscriptionInfo(firestore, uid, entitlements || {}, event_type)

  // Update Firebase Auth Custom Claims
  await updateFirebaseAuthClaims(uid, entitlements || {}, event_type)

  // Handle specific event types
  await handleSubscriptionLifecycleEvent(firestore, uid, event_type, doc)

  // Track latest event for quick access
  await firestore.doc(latestSubscriptionEventPath(uid)).set({
    eventId: eventId,
    eventType: event_type,
    timestamp: admin.firestore.FieldValue.serverTimestamp(),
  })

  logger.info(`Mapped RevenueCat event ${event_type} for user ${uid}`)
}

/// Map RevenueCat customer creation (similar to onStripeCustomerCreated)
export async function onRevenueCatCustomerWritten(
  event: firestore.FirestoreEvent<Change<firestore.DocumentSnapshot> | undefined, ParamsOf<string>>
) {
  const customerId = event.params.customerId
  const firestore = admin.firestore()
  const doc = event.data?.after.data()
  
  if (doc === undefined) {
    return
  }

  const { app_user_id } = doc
  
  if (app_user_id) {
    try {
      // Create lookup document for reverse customer ID -> uid mapping
      const lookupDocRef = firestore.doc(revenueCatCustomerLookupPath(customerId))
      await lookupDocRef.set({
        uid: app_user_id,
        customerId: customerId,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      })

      logger.info(`Created RevenueCat customer lookup: ${customerId} -> ${app_user_id}`)
    } catch (error) {
      logger.error(`Failed to create RevenueCat customer lookup for ${customerId}:`, error)
    }
  }
}

/// Update user's subscription info document
async function updateUserSubscriptionInfo(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  entitlements: Record<string, any>,
  eventType: string
) {
  const subscriptionInfoRef = firestore.doc(userSubscriptionInfoPath(uid))
  
  // Check if user has premium entitlement (simplified for single premium check)
  const hasPremium = entitlements.premium?.expires_date ? 
    new Date(entitlements.premium.expires_date) > new Date() : false
  
  const updateData = {
    uid: uid,
    entitlements: entitlements,
    lastEventType: eventType,
    lastUpdated: admin.firestore.FieldValue.serverTimestamp(),
    hasPremium: hasPremium,
  }

  await subscriptionInfoRef.set(updateData, { merge: true })
}

/// Update Firebase Auth Custom Claims with entitlements (simplified for premium only)
async function updateFirebaseAuthClaims(
  uid: string,
  entitlements: Record<string, any>,
  eventType: string
) {
  try {
    // Check if user has premium entitlement (simplified)
    const hasPremium = entitlements.premium?.expires_date ? 
      new Date(entitlements.premium.expires_date) > new Date() : false
    
    const customClaims = {
      premium: hasPremium,
      lastSubscriptionUpdate: admin.firestore.Timestamp.now().toMillis(),
    }

    await admin.auth().setCustomUserClaims(uid, customClaims)
    logger.info(`Updated Firebase Auth claims for user ${uid}: premium=${hasPremium}`)
  } catch (error) {
    logger.error(`Failed to update Firebase Auth claims for user ${uid}:`, error)
  }
}

/// Handle subscription lifecycle events with business logic
async function handleSubscriptionLifecycleEvent(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventType: string,
  eventData: any
) {
  switch (eventType) {
    case 'initial_purchase':
      await handleInitialPurchase(firestore, uid, eventData)
      break
    case 'renewal':
      await handleRenewal(firestore, uid, eventData)
      break
    case 'non_renewing_purchase':
      await handleNonRenewingPurchase(firestore, uid, eventData)
      break
    case 'product_change':
      await handleProductChange(firestore, uid, eventData)
      break
    case 'cancellation':
      await handleCancellation(firestore, uid, eventData)
      break
    case 'uncancellation':
      await handleUncancellation(firestore, uid, eventData)
      break
    case 'expiration':
      await handleExpiration(firestore, uid, eventData)
      break
    case 'billing_issue':
      await handleBillingIssue(firestore, uid, eventData)
      break
    case 'subscription_paused':
      await handleSubscriptionPaused(firestore, uid, eventData)
      break
    case 'transfer':
      await handleTransfer(firestore, uid, eventData)
      break
    case 'test':
      logger.info(`Test event received for user ${uid}`)
      break
    default:
      logger.info(`Unhandled event type: ${eventType}`)
  }
}

/// Handle initial purchase events
async function handleInitialPurchase(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`New subscription for user ${uid}`)
  
  // Add to premium users collection
  await firestore.doc(`premium_users/${uid}`).set({
    uid: uid,
    subscribedAt: admin.firestore.FieldValue.serverTimestamp(),
    productId: eventData.product_id,
    platform: eventData.platform,
    firstPurchase: true,
  }, { merge: true })

  // TODO: Send welcome email
  // TODO: Track analytics event
  // TODO: Notify customer success team
}

/// Handle renewal events
async function handleRenewal(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Subscription renewed for user ${uid}`)
  
  // Update premium users info
  await firestore.doc(`premium_users/${uid}`).set({
    lastRenewal: admin.firestore.FieldValue.serverTimestamp(),
    renewalCount: admin.firestore.FieldValue.increment(1),
  }, { merge: true })

  // TODO: Send renewal confirmation email
  // TODO: Track retention analytics
}

/// Handle cancellation events  
async function handleCancellation(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Subscription cancelled for user ${uid}`)
  
  // Update premium users info
  await firestore.doc(`premium_users/${uid}`).set({
    cancelledAt: admin.firestore.FieldValue.serverTimestamp(),
    cancelReason: eventData.cancel_reason || 'unknown',
  }, { merge: true })

  // TODO: Trigger win-back email campaign
  // TODO: Send cancellation survey
  // TODO: Alert customer success team
}

/// Handle expiration events
async function handleExpiration(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Subscription expired for user ${uid}`)
  
  // Remove from premium users (or mark as expired)
  await firestore.doc(`premium_users/${uid}`).set({
    expiredAt: admin.firestore.FieldValue.serverTimestamp(),
    status: 'expired',
  }, { merge: true })

  // TODO: Send reactivation offers
  // TODO: Block premium features access
}

/// Handle billing issue events
async function handleBillingIssue(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Billing issue for user ${uid}`)
  
  // Track billing issues
  await firestore.doc(`billing_issues/${uid}_${Date.now()}`).set({
    uid: uid,
    timestamp: admin.firestore.FieldValue.serverTimestamp(),
    eventData: eventData,
  })

  // TODO: Send payment update notification
  // TODO: Trigger dunning campaign
  // TODO: Alert billing team
}

/// Handle non-renewing purchase events
async function handleNonRenewingPurchase(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Non-renewing purchase for user ${uid}`)
  
  // Track one-time purchases
  await firestore.doc(`one_time_purchases/${uid}_${Date.now()}`).set({
    uid: uid,
    purchasedAt: admin.firestore.FieldValue.serverTimestamp(),
    productId: eventData.product_id,
    platform: eventData.platform,
    price: eventData.price,
    currency: eventData.currency,
  })
}

/// Handle product change events
async function handleProductChange(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Product change for user ${uid}`)
  
  // Update premium users info
  await firestore.doc(`premium_users/${uid}`).set({
    productChanged: admin.firestore.FieldValue.serverTimestamp(),
    currentProductId: eventData.product_id,
  }, { merge: true })
}

/// Handle uncancellation events
async function handleUncancellation(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Subscription reactivated for user ${uid}`)
  
  // Update premium users info
  await firestore.doc(`premium_users/${uid}`).set({
    reactivatedAt: admin.firestore.FieldValue.serverTimestamp(),
    status: 'active',
  }, { merge: true })
}

/// Handle subscription paused events
async function handleSubscriptionPaused(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Subscription paused for user ${uid}`)
  
  // Update premium users info
  await firestore.doc(`premium_users/${uid}`).set({
    pausedAt: admin.firestore.FieldValue.serverTimestamp(),
    status: 'paused',
  }, { merge: true })
}

/// Handle transfer events
async function handleTransfer(
  firestore: FirebaseFirestore.Firestore,
  uid: string,
  eventData: any
) {
  logger.info(`Transfer event for user ${uid}`)
  
  // Log transfer for audit purposes
  await firestore.doc(`transfers/${uid}_${Date.now()}`).set({
    uid: uid,
    timestamp: admin.firestore.FieldValue.serverTimestamp(),
    eventData: eventData,
  })
}