import * as admin from "firebase-admin"
import * as logger from "firebase-functions/logger"
import * as firestore from "@google-cloud/firestore"

export async function makeAdminIfWhitelisted(user: admin.auth.UserRecord) {
  const email = user.email
  if (email === undefined) {
    logger.log(`User ${user.uid} doesn't have an email address`)
    return
  }
  const whitelistedEmails = ["admin@gmail.com"]
  if (!whitelistedEmails.includes(email)) {
    logger.log(`${email} doesn't belong to a whitelisted`)
    return
  }
  if (user.customClaims?.admin === true) {
    logger.log(`${email} is already an admin`)
    return
  }
  // set custom claim
  await admin.auth().setCustomUserClaims(user.uid, {
    admin: true,
  })
  // write to Firestore so the client knows it needs to update
  await admin.firestore().doc(`metadata/${user.uid}`).set({
    refreshTime: firestore.FieldValue.serverTimestamp(),
  })
  logger.log(`Custom claim set! ${email} is now an admin`)
}
