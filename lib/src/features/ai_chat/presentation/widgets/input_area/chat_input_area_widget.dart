import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

class ChatInputAreaWidget extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onSendMessage;

  const ChatInputAreaWidget({super.key, required this.textController, required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundLight,
        border: Border(top: BorderSide(color: context.colors.borderSubtle)),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.rsp),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.backgroundAccent,
                  borderRadius: BorderRadius.circular(12.rr),
                ),
                child: TextField(
                  controller: textController,
                  style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
                  decoration: InputDecoration(
                    hintText: context.l10n.tellMeHowYouFeel,
                    hintStyle: context.textStyles.bodyMedium.copyWith(color: context.colors.textSecondary),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: context.dimensions.paddingMedium.rw,
                      vertical: context.dimensions.paddingMedium.rsp,
                    ),
                  ),
                  maxLines: 4,
                  minLines: 1,
                  textInputAction: TextInputAction.send,
                  onSubmitted: onSendMessage,
                ),
              ),
            ),
            SizedBox(width: 8.rw),
            Container(
              decoration: BoxDecoration(
                color: context.colors.backgroundAccent,
                borderRadius: BorderRadius.circular(12.rr),
              ),
              child: IconButton(
                onPressed: () => onSendMessage(textController.text),
                icon: Icon(Icons.send, size: 24.rsp, color: context.colors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
