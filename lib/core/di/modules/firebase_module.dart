import 'dart:io';

import 'package:aichat/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @singleton
  @preResolve
  Future<FirebaseApp> firebaseApp() async {
    final app = await Firebase.initializeApp(
      options: Platform.isAndroid ? DefaultFirebaseOptions.currentPlatform : null,
    );
    await FirebaseAppCheck.instance.activate(
      androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.appAttest,
    );
    return app;
  }

  @singleton
  FirebaseAuth firebaseAuth(FirebaseApp firebaseApp) => FirebaseAuth.instanceFor(app: firebaseApp);

  @singleton
  FirebaseFirestore firebaseFireStore(FirebaseApp firebaseApp) => FirebaseFirestore.instanceFor(app: firebaseApp);

  @singleton
  FirebaseStorage firebaseStorage(FirebaseApp firebaseApp) => FirebaseStorage.instanceFor(app: firebaseApp);
}
