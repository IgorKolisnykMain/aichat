import 'package:aichat/src/utils/error/domain/enums/local_error.dart';
import 'package:aichat/src/utils/error/domain/models/local_exception.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  factory ErrorHandler() {
    return _instance;
  }

  ErrorHandler._();

  static final ErrorHandler _instance = ErrorHandler._();

  static String processError(BuildContext context, Object? exception) {
    return switch (exception) {
      LocalException(error: final error) => error.toMessage(context),
      _ => LocalError.defaultError.toMessage(context),
    };
  }
}
