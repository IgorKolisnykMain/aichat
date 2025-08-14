import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_controller.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_event.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_state.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/header/chat_header_widget.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/input_area/chat_input_area_widget.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/massages/chat_list_widget.dart';
import 'package:aichat/src/utils/async_value_ui.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final scrollController = ScrollController();
  final textController = TextEditingController();

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(aiTutorControllerProvider, (previousState, state) {
      state.showSnackBarOnError(context);
      state.whenData(
        (data) => switch (data.stage) {
          AiTutorStage.sentAIAnswerSuccess => _scrollToBottom(),
          AiTutorStage.streamingResponse => _scrollToBottom(),
          _ => null,
        },
      );
    });

    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: ResponsiveCenter(
          child: Column(
            children: [
              const ChatHeaderWidget(),
              Expanded(
                child: Stack(
                  children: [
                    ChatListWidget(scrollController: scrollController),
                    //todo make loading via AsyncValueWidget
                    const LoadingIndicator(provider: aiTutorControllerProvider),
                  ],
                ),
              ),
              ChatInputAreaWidget(textController: textController, onSendMessage: _sendMessage),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Send question - controller will automatically detect API to use
    ref.read(aiTutorControllerProvider.notifier).handlerEvent(SendQuestionEvent(query: text.trim()));
    textController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
