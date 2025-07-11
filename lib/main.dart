import 'package:aichat/src/app.dart';
import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/core/di/configuration.dart';
import 'package:aichat/src/core/di/locator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  const environment = String.fromEnvironment("environment", defaultValue: "dev");
  await configureDependencies(environment);

  _registerErrorHandlers();

  // Bloc.observer = BlocMonitor();

  final appConfig = locator<AppConfigRepository>().config;

  runApp(ProviderScope(child: App(appConfig: appConfig)));
}

void _registerErrorHandlers() {
  FlutterError.onError = (errorDetails) {
    FlutterError.presentError(errorDetails);
    debugPrint(errorDetails.toString());
    if (kIsWeb == false) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint(error.toString());
    if (kIsWeb == false) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    return true;
  };
}
