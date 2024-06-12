/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

//! UNUSED FILE


import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

interface VerifyPollPasswordData {
  pollId: string;
  password: string;
}

export const verifyPollPassword = functions.https.onCall(async (data: VerifyPollPasswordData, context) => {
  const pollId = data.pollId;
  const enteredPassword = data.password;

  // Reference to the poll document
  const pollRef = admin.firestore().collection('polls').doc(pollId);

  try {
    const pollDoc = await pollRef.get();
    if (!pollDoc.exists) {
      throw new functions.https.HttpsError('not-found', 'Poll not found');
    }

    const pollData = pollDoc.data();
    const storedPassword = pollData?.password;

    if (storedPassword === enteredPassword) {
      return { success: true };
    } else {
      return { success: false, message: 'Incorrect password' };
    }
  } catch (error: any) {
    throw new functions.https.HttpsError('unknown', error.message, error);
  }
});

