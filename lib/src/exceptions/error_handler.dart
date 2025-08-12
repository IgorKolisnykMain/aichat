import 'package:aichat/src/exceptions/models/common_error.dart';
import 'package:aichat/src/exceptions/models/default_exeption.dart';
import 'package:aichat/src/exceptions/models/local_exeption.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  factory ErrorHandler() {
    return _instance;
  }

  ErrorHandler._();

  static final ErrorHandler _instance = ErrorHandler._();

  static String processError(BuildContext context, Object? exception) {
    return switch (exception) {
      LocalException() => exception.toLocMsg(context),
      StandardException() => exception.toLocMsg(context),
      CommonError() => exception.toString(),
      Exception() => exception.toString(),
      _ => UnknownError().toString(),
    };
  }
}
