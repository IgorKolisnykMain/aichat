import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_controller.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_event.dart';
import 'package:aichat/src/features/ai_chat/presentation/dialogs/widgets/thread_item_widget.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatTreadsBottomSheet extends ConsumerWidget {
  const ChatTreadsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aiTutorControllerProvider);
    return Container(
      padding: EdgeInsets.all(context.dimensions.paddingMedium.rsp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.conversations,
            style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.rsp),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              ref.read(aiTutorControllerProvider.notifier).handlerEvent(const CreateNewThreadEvent());
            },
            icon: Icon(Icons.add, size: 20.rsp),
            label: Text(context.l10n.newConversation),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primary,
              foregroundColor: context.colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.rsp),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.rr)),
            ),
          ),
          if (state.value!.userThreads.isNotEmpty) ...[
            SizedBox(height: 16.rsp),
            Text(
              context.l10n.previousConversations,
              style: context.textStyles.bodyMedium.copyWith(color: context.colors.textSecondary),
            ),
            SizedBox(height: 8.rsp),
            ...state.value!.userThreads.map(
              (threadId) => ThreadItemWidget(
                threadId: threadId,
                isSelected: state.value!.currentThreadId == threadId,
                onSelect: () {
                  Navigator.pop(context);
                  ref.read(aiTutorControllerProvider.notifier).handlerEvent(SelectThreadEvent(threadId: threadId));
                },
                onDelete: () {
                  Navigator.pop(context);
                  ref.read(aiTutorControllerProvider.notifier).handlerEvent(DeleteThreadEvent(threadId: threadId));
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
