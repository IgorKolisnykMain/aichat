import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kWebRecaptchaSiteKey = '6LfZpH8rAAAAAIKDt-CmSdwTS8SliRe2zHXCFoXC';

final firebaseAppProvider = Provider<FirebaseApp>((ref) {
  // * Override this in the main method. To use Provider instead of FutureProvider
  throw UnimplementedError();
});

final firebaseAppCheckProvider = FutureProvider<void>((ref) async {
  await FirebaseAppCheck.instanceFor(app: ref.read(firebaseAppProvider)).activate(
    // Always use debug provider for development
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
  );
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instanceFor(app: ref.read(firebaseAppProvider));
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instanceFor(app: ref.read(firebaseAppProvider));
});

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instanceFor(app: ref.read(firebaseAppProvider));
});
