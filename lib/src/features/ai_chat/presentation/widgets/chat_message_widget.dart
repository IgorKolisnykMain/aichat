import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message/ai_message.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final AiMessage message;
  final bool isLoading;

  const ChatMessageWidget({super.key, required this.message, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (message.type == AiChatItemType.header) {
      return _buildHeaderMessage(context);
    }

    final isUser = message.type == AiChatItemType.myQuestion;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 8.rsp),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[_buildAvatar(context, isUser), SizedBox(width: 12.rw)],
          Flexible(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 4.rsp),
                  child: Text(
                    isUser ? context.l10n.user : context.l10n.aiPsychologist,
                    style: context.textStyles.bodySmall.copyWith(color: context.colors.textSecondary),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 12.rsp),
                  decoration: BoxDecoration(
                    color: isUser ? context.colors.primaryLight : context.colors.backgroundAccent,
                    borderRadius: BorderRadius.circular(12.rr),
                  ),
                  child: isLoading
                      ? _buildLoadingIndicator(context)
                      : Text(
                          message.message,
                          style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
                        ),
                ),
              ],
            ),
          ),
          if (isUser) ...[SizedBox(width: 12.rw), _buildAvatar(context, isUser)],
        ],
      ),
    );
  }

  Widget _buildHeaderMessage(BuildContext context) {
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
            message.message,
            style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, bool isUser) {
    return Container(
      width: 40.rw,
      height: 40.rh,
      decoration: BoxDecoration(
        color: isUser ? context.colors.primaryMedium : context.colors.backgroundAccentSubtle,
        borderRadius: BorderRadius.circular(20.rr),
      ),
      child: Center(
        child: isUser
            ? Text(
                context.l10n.user[0].toUpperCase(),
                style: context.textStyles.buttonMedium.copyWith(color: context.colors.white),
              )
            : Icon(Icons.psychology, size: 24.rsp, color: context.colors.primary),
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
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
