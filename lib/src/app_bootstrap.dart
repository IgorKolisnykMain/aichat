import 'dart:io';

import 'package:aichat/src/app.dart';
import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/core/env/env.dart';
import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/onboarding/auth/application/user_token_refresh_service.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_sync_service.dart';
import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class AppBootstrap {
  Widget createRootWidget({required ProviderContainer container}) {
    // * Initialize AuthSyncService to start the listener
    container.read(authSyncServiceProvider);
    container.read(firebaseAppCheckProvider);
    // * Initialize UserTokenRefreshService
    container.read(userTokenRefreshServiceProvider);

    final errorLogger = container.read(errorLoggerProvider);
    _registerErrorHandlers(errorLogger);

    final appConfigRepo = container.read(appConfigRepositoryProvider);
    return UncontrolledProviderScope(
      container: container,
      child: AppAdaptiveUI(config: appConfigRepo.config),
    );
  }

  Future<void> setupFirebaseEmulators() async {
    await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('127.0.0.1', 8080);
    FirebaseFunctions.instance.useFunctionsEmulator('127.0.0.1', 5001);
  }

  Future<void> setupStripe() async {
    if (kIsWeb || Platform.isIOS || Platform.isAndroid) {
      Stripe.publishableKey = Env.stripePublishableKey;
      // https://stripe.com/gb/resources/more/merchant-id
      Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
      // https://stripe.com/docs/payments/mobile/accept-payment?platform=ios&ui=payment-sheet#ios-set-up-return-url
      Stripe.urlScheme = 'flutterstripe';
      await Stripe.instance.applySettings();
    }
  }

  Future<void> setupRevenueCat({required ProviderContainer container}) async {
    try {
      // Initialize RevenueCat with Firebase Auth sync
      final purchasesRepository = container.read(purchasesRepositoryProvider);
      await purchasesRepository.init();
    } catch (e) {
      // Handle RevenueCat initialization errors gracefully
      // App should still work even if RevenueCat fails to initialize
      debugPrint('RevenueCat initialization failed: $e');
    }
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
}
