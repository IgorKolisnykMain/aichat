import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/features/ai_chat/domain/enums/message_type.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message/ai_message.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/massages/avatar_message_widget.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/massages/message_loading_indicator.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final AiMessage message;
  final bool isLoading;

  const ChatMessageWidget({super.key, required this.message, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return switch (message.type) {
      AiChatItemType.header => const _HeaderMessageWidget(),
      AiChatItemType.myQuestion => _BodyMessageWidget(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        backgroundColor: context.colors.primaryLight,
        isLoading: isLoading,
        message: message,
        messageType: MessageType.user,
        userName: context.l10n.user,
      ),
      AiChatItemType.aiAnswer => _BodyMessageWidget(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        backgroundColor: context.colors.backgroundAccent,
        isLoading: isLoading,
        message: message,
        messageType: MessageType.ai,
        userName: context.l10n.aiPsychologist,
      ),
    };
  }
}

class _HeaderMessageWidget extends StatelessWidget {
  const _HeaderMessageWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 16.rsp),
      padding: EdgeInsets.all(16.rsp),
      decoration: BoxDecoration(
        color: context.colors.backgroundAccentSubtle,
        borderRadius: BorderRadius.circular(12.rr),
      ),
      child: Column(
        children: [
          Icon(Icons.psychology, size: 48.rsp, color: context.colors.primary),
          SizedBox(height: 12.rsp),
          Text(
            context.l10n.hearMeOutAiPsychologist,
            style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _BodyMessageWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color backgroundColor;
  final bool isLoading;
  final AiMessage message;
  final MessageType messageType;
  final String userName;

  const _BodyMessageWidget({
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.backgroundColor,
    required this.isLoading,
    required this.message,
    required this.messageType,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (messageType == MessageType.ai) ...[
          const AvatarMessageWidget(messageType: MessageType.ai),
          SizedBox(width: 12.rw),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.rsp),
                child: Text(
                  userName,
                  style: context.textStyles.bodySmall.copyWith(color: context.colors.textSecondary),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 12.rsp),
                decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(12.rr)),
                child: isLoading
                    ? const MessageLoadingIndicator()
                    : Text(
                        message.message,
                        style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
                      ),
              ),
            ],
          ),
        ),
        if (messageType == MessageType.user) ...[
          SizedBox(width: 12.rw),
          const AvatarMessageWidget(messageType: MessageType.user),
        ],
      ],
    );
  }
}
