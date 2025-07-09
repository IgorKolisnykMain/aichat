import 'package:flutter/material.dart';

mixin MessagePresenter {
  void showSnackBar(String message, BuildContext context, [Duration duration = const Duration(seconds: 1)]) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message, textAlign: TextAlign.center),
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
