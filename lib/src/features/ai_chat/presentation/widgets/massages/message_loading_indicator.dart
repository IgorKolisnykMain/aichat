import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class MessageLoadingIndicator extends StatelessWidget {
  const MessageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 12.rsp,
          height: 12.rsp,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(context.colors.textSecondary),
          ),
        ),
        SizedBox(width: 8.rw),
        Text('...', style: context.textStyles.bodyMedium.copyWith(color: context.colors.textSecondary)),
      ],
    );
  }
}
