import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_controller.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_state.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/chat_message_widget.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListWidget extends ConsumerWidget {
  const ChatListWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aiTutorControllerProvider);

    if (state.value == null || state.value!.messages.isEmpty) {
      return const SizedBox();
    }

    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(vertical: 16.rsp),
      itemCount: state.value!.messages.length,
      itemBuilder: (context, index) {
        final message = state.value!.messages[index];
        return ChatMessageWidget(
          message: message,
          isLoading:
              (state.value!.stage == AiTutorStage.sentAIAnswerProgress ||
                  state.value!.stage == AiTutorStage.streamingResponse && state.value!.isStreaming) &&
              index == state.value!.messages.length - 1 &&
              message.type == AiChatItemType.aiAnswer,
        );
      },
    );
  }
}
