import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/exceptions/models/common_error.dart';
import 'package:aichat/src/exceptions/models/default_exeption.dart';
import 'package:aichat/src/exceptions/models/local_exeption.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Error logger class to keep track of all AsyncError states that are set
/// by the controllers in the app
class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final errorLogger = context.container.read(errorLoggerProvider);
    final error = _findError(newValue);
    if (error != null) {
      if (error.error is CommonError) {
        errorLogger.logCommonError(error.error as CommonError);
      } else if (error.error is StandardException) {
        errorLogger.logStandardException(error.error as StandardException);
      } else if (error.error is LocalException) {
        errorLogger.logLocalException(error.error as LocalException);
      } else {
        errorLogger.logError(error.error, error.stackTrace);
      }
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    if (value is AsyncError) {
      return value;
    } else {
      return null;
    }
  }
}
