import * as admin from "firebase-admin"
import * as logger from "firebase-functions/logger"
import * as functionsV2 from "firebase-functions/v2"

export const deleteAccount = async (context: functionsV2.https.CallableRequest) => {
  logger.log("Start deleteAccount function")
  const uid = context.auth?.uid
  if (!uid) {
    throw new functionsV2.https.HttpsError("unauthenticated", "You need to be authenticated to perform this action")
  }
  logger.log(`Get uid: ${uid}`)
  const firestore = admin.firestore()
  logger.log("Get firestore")
  const userDoc = firestore.collection("users").doc(uid)
  const metadataDoc = firestore.collection("metadata").doc(uid)
  await userDoc.delete()
  await metadataDoc.delete()
  logger.log(`Deleted user doc at ${userDoc.path}, ${metadataDoc.path}`)

  const auth = admin.auth()
  logger.log("Get auth")
  await auth.deleteUser(uid)
  logger.log(`Deleted user at ${uid}`)
  return { "success": true }
}
