import 'package:aichat/src/exceptions/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showSnackBarOnError(BuildContext context, [Duration duration = const Duration(seconds: 1)]) {
    if (!isLoading && hasError) {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(ErrorHandler.processError(context, error), textAlign: TextAlign.center),
        duration: duration,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
