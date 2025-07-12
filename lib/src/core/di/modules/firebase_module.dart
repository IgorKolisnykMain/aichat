import 'package:aichat/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kWebRecaptchaSiteKey = '6LfZpH8rAAAAAIKDt-CmSdwTS8SliRe2zHXCFoXC';

final firebaseAppProvider = FutureProvider<FirebaseApp>((ref) async {
  final app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    await FirebaseAppCheck.instance.activate(
      androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.appAttest,
      webProvider: kDebugMode ? ReCaptchaV3Provider(kWebRecaptchaSiteKey) : ReCaptchaV3Provider(kWebRecaptchaSiteKey),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
  return app;
});

final firebaseAuthProvider = FutureProvider<FirebaseAuth>((ref) async {
  return FirebaseAuth.instanceFor(app: await ref.read(firebaseAppProvider.future));
});

final firestoreProvider = FutureProvider<FirebaseFirestore>((ref) async {
  return FirebaseFirestore.instanceFor(app: await ref.read(firebaseAppProvider.future));
});

final firebaseStorageProvider = FutureProvider<FirebaseStorage>((ref) async {
  return FirebaseStorage.instanceFor(app: await ref.read(firebaseAppProvider.future));
});
