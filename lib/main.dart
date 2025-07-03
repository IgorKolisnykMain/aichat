import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aichat/core/app/app.dart';
import 'package:aichat/core/bloc_monitor.dart';
import 'package:aichat/core/di/configuration.dart';
import 'package:aichat/core/di/locator.dart';
import 'package:aichat/domain/repository/app_config_repository.dart';
import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment = String.fromEnvironment("environment", defaultValue: "dev");
  await configureDependencies(environment);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Bloc.observer = BlocMonitor();

  final isLoggedIn =
      !locator<AuthFirebaseRepository>().isExpiredSession() && await locator<AuthFirebaseRepository>().isUserExists();

  final router = AppRouter.init(isLoggedIn);
  final appConfig = locator<AppConfigRepository>().config;

  runApp(App(appConfig: appConfig, appRouter: router));
}
