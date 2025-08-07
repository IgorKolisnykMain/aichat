import 'package:aichat/firebase_options.dart';
import 'package:aichat/src/app.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  _registerErrorHandlers();

  final appConfigRepo = await AppConfigRepositoryImpl.init();
  final firebaseApp = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(
    ProviderScope(
      overrides: [
        appConfigRepositoryProvider.overrideWith((ref) => appConfigRepo),
        firebaseAppProvider.overrideWith((ref) => firebaseApp),
      ],
      child: AppAdaptiveUI(config: appConfigRepo.config),
    ),
  );
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
