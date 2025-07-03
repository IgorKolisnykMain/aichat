import 'package:aichat/core/extensions/build_context_extensions.dart';
import 'package:aichat/domain/enum/ai_chat_item_type.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_bloc.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_event.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_state.dart';
import 'package:aichat/presentation/features/ai_chat/widgets/chat_message_widget.dart';
import 'package:aichat/presentation/widgets/bloc/bloced_state.dart';
import 'package:aichat/presentation/widgets/loading/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BlocedState<MainScreen, AiTutorBloc, AiTutorState> {
  final horizontalPadding = 16.w;
  final verticalPadding = 8.sp;
  final scrollController = ScrollController();
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Инициализируем Assistant API и загружаем историю
    bloc.add(const InitializeAssistantEvent());
    bloc.add(LoadHistoryEvent());
  }

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return blocListener(
      listener: (context, state) {
        if (state.stage == AiTutorStage.sentAIAnswerSuccess || state.stage == AiTutorStage.streamingResponse) {
          _scrollToBottom();
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Stack(
                  children: [
                    _buildChatList(),
                    blocBuilder(
                      builder: (context, state) =>
                          state.stage == AiTutorStage.loading ? const LoadingIndicator() : const SizedBox(),
                    ),
                  ],
                ),
              ),
              _buildInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: context.colors.backgroundLight,
        border: Border(bottom: BorderSide(color: context.colors.borderSubtle)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 48.w),
              child: Text(
                context.l10n.hearMeOutAiPsychologist,
                style: context.textStyles.authTitle.copyWith(color: context.colors.textDark),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: context.colors.borderSubtle),
            ),
            child: IconButton(
              onPressed: () {
                _showThreadsMenu();
              },
              icon: Icon(Icons.menu, size: 24.sp, color: context.colors.textDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return blocBuilder(
      builder: (context, state) {
        if (state.messages.isEmpty) {
          return const SizedBox();
        }

        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.symmetric(vertical: 16.sp),
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final message = state.messages[index];
            return ChatMessageWidget(
              message: message,
              isLoading:
                  (state.stage == AiTutorStage.sentAIAnswerProgress ||
                      state.stage == AiTutorStage.streamingResponse && state.isStreaming) &&
                  index == state.messages.length - 1 &&
                  message.type == AiChatItemType.aiAnswer,
            );
          },
        );
      },
    );
  }

  Widget _buildInputArea() {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundLight,
        border: Border(top: BorderSide(color: context.colors.borderSubtle)),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.backgroundAccent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TextField(
                  controller: textController,
                  style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
                  decoration: InputDecoration(
                    hintText: context.l10n.tellMeHowYouFeel,
                    hintStyle: context.textStyles.bodyMedium.copyWith(color: context.colors.textSecondary),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.sp),
                  ),
                  maxLines: 4,
                  minLines: 1,
                  textInputAction: TextInputAction.send,
                  onSubmitted: _sendMessage,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              decoration: BoxDecoration(
                color: context.colors.backgroundAccent,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                onPressed: () => _sendMessage(textController.text),
                icon: Icon(Icons.send, size: 24.sp, color: context.colors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Используем новый event для работы с Assistants API
    bloc.add(SendQuestionToAssistantEvent(query: text.trim()));
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

  void _showThreadsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (BuildContext context) {
        return blocBuilder(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.l10n.conversations,
                    style: context.textStyles.bodyMedium.copyWith(color: context.colors.textDark),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.sp),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      bloc.add(const CreateNewThreadEvent());
                    },
                    icon: Icon(Icons.add, size: 20.sp),
                    label: Text(context.l10n.newConversation),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.primary,
                      foregroundColor: context.colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.sp),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                  ),
                  if (state.userThreads.isNotEmpty) ...[
                    SizedBox(height: 16.sp),
                    Text(
                      context.l10n.previousConversations,
                      style: context.textStyles.bodyMedium.copyWith(color: context.colors.textSecondary),
                    ),
                    SizedBox(height: 8.sp),
                    ...state.userThreads.map((threadId) => _buildThreadItem(threadId, state)),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildThreadItem(String threadId, AiTutorState state) {
    final isSelected = state.currentThreadId == threadId;
    return Container(
      margin: EdgeInsets.only(bottom: 8.sp),
      decoration: BoxDecoration(
        color: isSelected ? context.colors.primary.withValues(alpha: 0.1) : context.colors.backgroundAccent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: isSelected ? context.colors.primary : context.colors.borderSubtle),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.sp),
        title: Text(
          'Thread ${threadId.substring(0, 8)}...',
          style: context.textStyles.bodyMedium.copyWith(
            color: isSelected ? context.colors.primary : context.colors.textDark,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSelected)
              IconButton(
                icon: Icon(Icons.chat_bubble_outline, size: 20.sp, color: context.colors.textSecondary),
                onPressed: () {
                  Navigator.pop(context);
                  bloc.add(SelectThreadEvent(threadId: threadId));
                },
              ),
            IconButton(
              icon: Icon(Icons.delete_outline, size: 20.sp, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
                bloc.add(DeleteThreadEvent(threadId: threadId));
              },
            ),
          ],
        ),
      ),
    );
  }
}
