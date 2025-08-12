import 'package:aichat/src/exceptions/models/common_error.dart';
import 'package:aichat/src/exceptions/models/default_exeption.dart';
import 'package:aichat/src/exceptions/models/local_exeption.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$error, $stackTrace');
    if (kIsWeb == false) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    }
  }

  void logFlutterErrorDetails(FlutterErrorDetails errorDetails) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$errorDetails');
    if (kIsWeb == false) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    }
  }

  void logCommonError(CommonError exception) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$exception');
    if (kIsWeb == false) {
      FirebaseCrashlytics.instance.recordError(exception, null, fatal: true);
    }
  }

  void logStandardException(StandardException exception) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$exception');
  }

  void logLocalException(LocalException exception) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$exception');
  }
}

final errorLoggerProvider = Provider<ErrorLogger>((ref) {
  return ErrorLogger();
});
