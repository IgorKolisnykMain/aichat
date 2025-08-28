import { setGlobalOptions } from "firebase-functions";
import * as functionsV1 from "firebase-functions/v1";
import * as functionsV2 from "firebase-functions/v2";
import * as admin from "firebase-admin";

admin.initializeApp();

setGlobalOptions({ maxInstances: 10 });

// Admin
import { makeAdminIfWhitelisted } from "./admin"
import { deleteAccount } from "./account"

exports.onUserCreated = functionsV1.auth.user().onCreate((user) => makeAdminIfWhitelisted(user))

exports.deleteAccount = functionsV2.https.onCall(deleteAccount);

import { stripeSecretKey } from "./stripe_secret"
// Stripe triggers
import {
  onStripeProductWritten,
  onStripePriceWritten,
  onStripeCustomerCreated,
  onStripePaymentWritten,
} from "./stripe"

// RevenueCat triggers
import {
  onRevenueCatEventWritten,
  onRevenueCatCustomerWritten,
} from "./revenuecat"

// Triggered when a Stripe product is written to Firestore
exports.onStripeProductWritten = functionsV2.firestore.onDocumentWritten(
  "/stripe_products/{id}",
  onStripeProductWritten,
)

// Triggered when a Stripe price is written to Firestore
exports.onStripePriceWritten = functionsV2.firestore.onDocumentWritten(
  "/stripe_products/{id}/prices/{priceId}",
  onStripePriceWritten,
)

// Triggered when a Stripe customer is created
exports.onStripeCustomerCreated = functionsV2.firestore.onDocumentCreated(
  "/stripe_customers/{id}",
  onStripeCustomerCreated,
)

exports.onStripePaymentWritten = functionsV2.firestore.onDocumentWritten(
  {
    document: "/stripe_customers/{stripeId}/payments/{paymentId}",
    secrets: [stripeSecretKey],
  },
  onStripePaymentWritten,
)

// RevenueCat Firebase Extension event triggers
// Triggered when a RevenueCat subscription event is created by the Firebase Extension
exports.onRevenueCatEventWritten = functionsV2.firestore.onDocumentWritten(
  "/revenuecat_subscription_events/{eventId}",
  onRevenueCatEventWritten,
)

// Triggered when a RevenueCat customer is created by the Firebase Extension  
exports.onRevenueCatCustomerWritten = functionsV2.firestore.onDocumentWritten(
  "/revenuecat_subscription_customer/{customerId}",
  onRevenueCatCustomerWritten,
)
