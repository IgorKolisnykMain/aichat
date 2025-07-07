import 'package:aichat/core/app/app.dart';
import 'package:aichat/core/di/configuration.dart';
import 'package:aichat/core/di/locator.dart';
import 'package:aichat/domain/repository/app_config_repository.dart';
import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/navigation/app_router.dart';
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

  final isLoggedIn =
      !locator<AuthFirebaseRepository>().isExpiredSession() && await locator<AuthFirebaseRepository>().isUserExists();

  final router = AppRouter.init(isLoggedIn);
  final appConfig = locator<AppConfigRepository>().config;

  runApp(ProviderScope(child: App(appConfig: appConfig, appRouter: router)));
}

void _registerErrorHandlers() {
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
