import 'package:aichat/src/app_bootstrap.dart';
import 'package:aichat/src/app_bootstrap_open_ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> setupEmulators() async {
  await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('127.0.0.1', 8080);
  FirebaseFunctions.instance.useFunctionsEmulator('127.0.0.1', 5001);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  // create an app bootstrap instance
  final appBootstrap = AppBootstrap();
  final container = await createOpenAiProviderContainer();
  // final container = await createFirestoreProviderContainer();
  final root = appBootstrap.createRootWidget(container: container);

  // await setupEmulators();
  runApp(root);
}
