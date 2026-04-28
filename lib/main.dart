import 'package:aichat/src/app_bootstrap.dart';
import 'package:aichat/src/app_bootstrap_open_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  // create an app bootstrap instance
  final appBootstrap = AppBootstrap();
  final container = await createOpenAiProviderContainer();
  // final container = await createFirestoreProviderContainer();
  final root = appBootstrap.createRootWidget(container: container);

  await appBootstrap.setupStripe();
  // await appBootstrap.setupFirebaseEmulators();
  runApp(root);
}
