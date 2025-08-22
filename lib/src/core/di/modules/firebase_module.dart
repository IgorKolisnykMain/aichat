import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_module.g.dart';

const kWebRecaptchaSiteKey = '6LfZpH8rAAAAAIKDt-CmSdwTS8SliRe2zHXCFoXC';

@Riverpod(keepAlive: true)
FirebaseApp firebaseApp(Ref ref) {
  // * Override this in the main method. To use Provider instead of FutureProvider
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Future<void> firebaseAppCheck(Ref ref) async {
  await FirebaseAppCheck.instanceFor(app: ref.read(firebaseAppProvider)).activate(
    // Always use debug provider for development
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
  );
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instanceFor(app: ref.read(firebaseAppProvider));
}

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(Ref ref) {
  return FirebaseFirestore.instanceFor(app: ref.read(firebaseAppProvider));
}

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(Ref ref) {
  return FirebaseStorage.instanceFor(app: ref.read(firebaseAppProvider));
}

@Riverpod(keepAlive: true)
FirebaseFunctions firebaseFunctions(Ref ref) {
  return FirebaseFunctions.instanceFor(app: ref.read(firebaseAppProvider));
}
