import {setGlobalOptions} from "firebase-functions";
import * as functions from "firebase-functions/v2";
import * as admin from "firebase-admin";
import * as logger from "firebase-functions/logger";

admin.initializeApp();

setGlobalOptions({ maxInstances: 10 });

export const deleteAccount = functions.https.onCall(async (context: functions.https.CallableRequest) => {
    logger.log(`Start deleteAccount function`)
    const uid = context.auth?.uid
    if (!uid) {
        throw new functions.https.HttpsError("unauthenticated", "You need to be authenticated to perform this action")
    }
    logger.log(`Get uid: ${uid}`)
    const firestore = admin.firestore()
    logger.log(`Get firestore`)
    const userDoc = firestore.collection("users").doc(uid)
    logger.log(`Get userDoc: ${userDoc}`)
    await userDoc.delete()
    logger.log(`Deleted user doc at ${userDoc.path}`)

    const auth = admin.auth()
    logger.log(`Get auth`)
    await auth.deleteUser(uid)
    logger.log(`Deleted user at ${uid}`)
    return {"success": true}
});
