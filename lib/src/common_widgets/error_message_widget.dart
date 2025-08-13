import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: context.textStyles.bodyLarge.copyWith(color: Colors.red),
    );
  }
}
