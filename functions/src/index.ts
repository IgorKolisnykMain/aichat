import { setGlobalOptions } from "firebase-functions";
import * as functionsV2 from "firebase-functions/v2";
import * as functionsV1 from "firebase-functions/v1"
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";
import * as firestore from "@google-cloud/firestore"

admin.initializeApp();

setGlobalOptions({ maxInstances: 10 });

export const deleteAccount = functionsV2.https.onCall(async (context: functionsV2.https.CallableRequest) => {
  logger.log("Start deleteAccount function")
  const uid = context.auth?.uid
  if (!uid) {
    throw new functionsV2.https.HttpsError("unauthenticated", "You need to be authenticated to perform this action")
  }
  logger.log(`Get uid: ${uid}`)
  const firestore = admin.firestore()
  logger.log("Get firestore")
  const userDoc = firestore.collection("users").doc(uid)
  logger.log(`Get userDoc: ${userDoc}`)
  await userDoc.delete()
  logger.log(`Deleted user doc at ${userDoc.path}`)

  const auth = admin.auth()
  logger.log("Get auth")
  await auth.deleteUser(uid)
  logger.log(`Deleted user at ${uid}`)
  return { "success": true }
});

export const makeAdminIfWhitelisted = functionsV1.auth.user().onCreate(async (user) => {
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
});
