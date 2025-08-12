import 'package:aichat/firebase_options.dart';
import 'package:aichat/src/app.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/exceptions/async_error_logger.dart';
import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_sync_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  final appConfigRepo = await AppConfigRepositoryImpl.init();
  final firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final container = ProviderContainer(
    overrides: [
      appConfigRepositoryProvider.overrideWith((ref) => appConfigRepo),
      firebaseAppProvider.overrideWith((ref) => firebaseApp),
    ],
    observers: [
      AsyncErrorLogger(),
    ],
  );

  // * Initialize CartSyncService to start the listener
  container.read(authSyncServiceProvider);
  container.read(firebaseAppCheckProvider);

  final errorLogger = container.read(errorLoggerProvider);
  _registerErrorHandlers(errorLogger);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: AppAdaptiveUI(config: appConfigRepo.config),
    ),
  );
}

void _registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (errorDetails) {
    FlutterError.presentError(errorDetails);
    errorLogger.logFlutterErrorDetails(errorDetails);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (error, stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
