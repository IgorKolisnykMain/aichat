import 'package:aichat/src/common_widgets/loading/loading_indicator.dart';
import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_controller.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_event.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_state.dart';
import 'package:aichat/src/features/ai_chat/presentation/widgets/chat_list_widget.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final horizontalPadding = 16.rw;
  final verticalPadding = 8.rsp;
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
      if (state.value?.stage == AiTutorStage.sentAIAnswerSuccess ||
          state.value?.stage == AiTutorStage.streamingResponse) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: ResponsiveCenter(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Stack(
                  children: [
                    ChatListWidget(scrollController: scrollController),
                    LoadingIndicator(provider: aiTutorControllerProvider),
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
          Container(
            width: 48.rw,
            height: 48.rh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.rr),
              border: Border.all(color: context.colors.borderSubtle),
            ),
            child: IconButton(
              onPressed: () {
                _logout();
              },
              icon: Icon(Icons.logout, size: 24.rsp, color: context.colors.textDark),
            ),
          ),
          Expanded(
            child: Text(
              context.l10n.hearMeOutAiPsychologist,
              style: context.textStyles.authTitle.copyWith(color: context.colors.textDark),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 48.rw,
            height: 48.rh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.rr),
              border: Border.all(color: context.colors.borderSubtle),
            ),
            child: IconButton(
              onPressed: () {
                _showThreadsMenu();
              },
              icon: Icon(Icons.menu, size: 24.rsp, color: context.colors.textDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 16.rsp),
                  ),
                  maxLines: 4,
                  minLines: 1,
                  textInputAction: TextInputAction.send,
                  onSubmitted: _sendMessage,
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
                onPressed: () => _sendMessage(textController.text),
                icon: Icon(Icons.send, size: 24.rsp, color: context.colors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Use new event for working with Assistants API
    ref.read(aiTutorControllerProvider.notifier).handlerEvent(SendQuestionToAssistantEvent(query: text.trim()));
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

  Future<void> _logout() async {
    (await ref.read(authRepoProvider.future)).logout();
  }

  void _showThreadsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.rr))),
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(aiTutorControllerProvider);
            return Container(
              padding: EdgeInsets.all(16.rsp),
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
                    ...state.value!.userThreads.map((threadId) => _buildThreadItem(threadId, state.value!)),
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
      margin: EdgeInsets.only(bottom: 8.rsp),
      decoration: BoxDecoration(
        color: isSelected ? context.colors.primary.withValues(alpha: 0.1) : context.colors.backgroundAccent,
        borderRadius: BorderRadius.circular(12.rr),
        border: Border.all(color: isSelected ? context.colors.primary : context.colors.borderSubtle),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.rw, vertical: 4.rsp),
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
                icon: Icon(Icons.chat_bubble_outline, size: 20.rsp, color: context.colors.textSecondary),
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(aiTutorControllerProvider.notifier).handlerEvent(SelectThreadEvent(threadId: threadId));
                },
              ),
            IconButton(
              icon: Icon(Icons.delete_outline, size: 20.rsp, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
                ref.read(aiTutorControllerProvider.notifier).handlerEvent(DeleteThreadEvent(threadId: threadId));
              },
            ),
          ],
        ),
      ),
    );
  }
}
