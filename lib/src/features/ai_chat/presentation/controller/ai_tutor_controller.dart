import 'dart:async';

import 'package:aichat/src/features/ai_chat/data/providers/ai_chat_providers.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';
import 'package:aichat/src/features/ai_chat/domain/services/ai_chat_service.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_event.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_tutor_controller.g.dart';

@riverpod
class AiTutorController extends _$AiTutorController {
  late final AiChatService _aiChatService;
  StreamSubscription<ChatHistory>? _streamSubscription;

  @override
  Future<AiTutorState> build() async {
    ref.onDispose(dispose);
    _aiChatService = ref.read(aiChatServiceProvider);

    // Load initial history
    return await _loadHistory();
  }

  void dispose() {
    _streamSubscription?.cancel();
  }

  void handlerEvent(AiTutorEvent event) => switch (event) {
    SendQuestionEvent(query: final query) => _sendQuestion(query),
    CreateNewThreadEvent() => _createNewThread(),
    SelectThreadEvent(threadId: final threadId) => _selectThread(threadId),
    DeleteThreadEvent(threadId: final threadId) => _deleteThread(threadId),
  };

  Future<AiTutorState> _loadHistory() async {
    final threads = await _aiChatService.getUserThreads();
    final currentThreadId = threads.isNotEmpty ? threads.last : null;

    final ChatHistory chatHistory;
    if (currentThreadId != null) {
      chatHistory = await _aiChatService.getThreadHistory(currentThreadId);
    } else {
      chatHistory = await _aiChatService.getChatHistory();
    }

    return AiTutorState(
      stage: AiTutorStage.init,
      chatHistory: chatHistory,
      currentThreadId: currentThreadId,
      userThreads: threads,
    );
  }

  Future<void> _sendQuestion(String question) async {
    final currentThreadId = state.value?.currentThreadId;

    if (currentThreadId != null) {
      // If there's an active thread - use streaming
      await _sendQuestionWithStreaming(question, currentThreadId);
    } else {
      // If no thread - use regular chat
      state = AsyncValue.data(
        state.value!.copyWith(chatHistory: state.value!.chatHistory.addLoadingMockMessage()),
      );
      state = await AsyncValue.guard(() async {
        final ChatHistory chatHistory = await _aiChatService.sendQuestion(question);
        return state.value!.copyWith(
          chatHistory: chatHistory,
          stage: AiTutorStage.sentAIAnswerSuccess,
        );
      });
    }
  }

  Future<void> _sendQuestionWithStreaming(String question, String threadId) async {
    _streamSubscription?.cancel();

    final stream = _aiChatService.watchQuestion(question, threadId: threadId);

    _streamSubscription = stream.listen(
      (chatHistory) {
        state = AsyncValue.data(
          state.value!.copyWith(
            chatHistory: chatHistory,
            stage: AiTutorStage.streamingResponse,
            isStreaming: true,
          ),
        );
      },
      onDone: () {
        if (state.value != null) {
          state = AsyncValue.data(
            state.value!.copyWith(
              stage: AiTutorStage.sentAIAnswerSuccess,
              isStreaming: false,
            ),
          );
        }
      },
      onError: (Object error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<void> _createNewThread() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final threadId = await _aiChatService.createThread();
      final threads = await _aiChatService.getUserThreads();
      final chatHistory = await _aiChatService.getChatHistory();

      return state.value!.copyWith(
        stage: AiTutorStage.init,
        currentThreadId: threadId,
        userThreads: threads,
        chatHistory: chatHistory,
      );
    });
  }

  Future<void> _selectThread(String threadId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final ChatHistory chatHistory = await _aiChatService.getThreadHistory(threadId);
      return state.value!.copyWith(
        stage: AiTutorStage.init,
        currentThreadId: threadId,
        chatHistory: chatHistory,
      );
    });
  }

  Future<void> _deleteThread(String threadId) async {
    state = await AsyncValue.guard(() async {
      await _aiChatService.deleteThread(threadId);
      final threads = await _aiChatService.getUserThreads();
      String? newCurrentThreadId = state.value!.currentThreadId;
      ChatHistory chatHistory = state.value!.chatHistory;

      if (state.value!.currentThreadId == threadId) {
        newCurrentThreadId = null;
        chatHistory = await _aiChatService.getChatHistory();
      }

      return state.value!.copyWith(
        currentThreadId: newCurrentThreadId,
        userThreads: threads,
        chatHistory: chatHistory,
      );
    });
  }
}
