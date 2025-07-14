import 'package:aichat/src/features/ai_chat/domain/enums/message_type.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class AvatarMessageWidget extends StatelessWidget {
  final MessageType messageType;

  const AvatarMessageWidget({super.key, required this.messageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.rw,
      height: 40.rh,
      decoration: BoxDecoration(
        color: switch (messageType) {
          MessageType.user => context.colors.primaryMedium,
          MessageType.ai => context.colors.backgroundAccentSubtle,
        },
        borderRadius: BorderRadius.circular(20.rr),
      ),
      child: Center(
        child: switch (messageType) {
          MessageType.user => Text(
            context.l10n.user[0].toUpperCase(),
            style: context.textStyles.buttonMedium.copyWith(color: context.colors.white),
          ),
          MessageType.ai => Icon(Icons.psychology, size: 24.rsp, color: context.colors.primary),
        },
      ),
    );
  }
}
