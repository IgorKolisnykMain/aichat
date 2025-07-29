import 'dart:async';

import 'package:aichat/src/features/ai_chat/data/repository/ai_tutor_repo_impl.dart';
import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_event.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_state.dart';
import 'package:aichat/src/utils/connection/data/services/connectivity_detector_service_impl.dart';
import 'package:aichat/src/utils/connection/domain/services/connectivity_detector_service.dart';
import 'package:aichat/src/utils/error/domain/enums/local_error.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final aiTutorControllerProvider = AsyncNotifierProvider.autoDispose<AiTutorController, AiTutorState>(
  () => AiTutorController(),
);

class AiTutorController extends AsyncNotifier<AiTutorState> {
  late final AiTutorRepo aiRepo;
  late final ConnectivityDetectorService connectivity;
  StreamSubscription<String>? _streamSubscription;
  String _currentStreamingMessage = '';

  @override
  Future<AiTutorState> build() async {
    ref.onDispose(dispose);
    state = const AsyncValue.loading();
    aiRepo = await ref.read(aiTutorOpenAiRepoProvider.future);
    connectivity = ref.read(connectivityDetectorServiceProvider);

    // Initialize Assistant API and load history
    handlerEvent(const InitializeAssistantEvent());
    handlerEvent(LoadHistoryEvent());

    return const AiTutorState(
      stage: AiTutorStage.initial,
      chatHistory: ChatHistory(messages: []),
      streamingResponse: '',
    );
  }

  void dispose() {
    _streamSubscription?.cancel();
  }

  void handlerEvent(AiTutorEvent event) => switch (event) {
    LoadHistoryEvent() => _loadHistory(),
    SendQuestionEvent(query: final query) => _getAnswer(query),
    TryAgainSendQuestionEvent() =>
      state.value!.aiAnsweringOnQuestion != null
          ? _tryAgainSendQuestion(state.value!.aiAnsweringOnQuestion!, state.value!.chatHistory)
          : Future.value(),
    // Assistants API v2 handlers
    InitializeAssistantEvent() => _initializeAssistant(),
    CreateNewThreadEvent() => _createNewThread(),
    SelectThreadEvent(threadId: final threadId) => _selectThread(threadId),
    DeleteThreadEvent(threadId: final threadId) => _deleteThread(threadId),
    SendQuestionToAssistantEvent(query: final query) => _sendQuestionToAssistant(query),
    StreamResponseUpdateEvent(chunk: final chunk) => _updateStreamingResponse(chunk),
  };

  Future<void> _loadHistory() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ChatHistory chatHistory;

      // Если есть текущий thread, загружаем из OpenAI
      if (state.value?.currentThreadId != null) {
        chatHistory = await aiRepo.getThreadHistory(state.value!.currentThreadId!);
      } else {
        // Если нет активного thread, загружаем из Firestore (для обратной совместимости)
        chatHistory = await aiRepo.getChatHistory();
        final headerMessage = AiMessage.header(message: aiRepo.settings.headerMessage);
        chatHistory = chatHistory.addHeaderMessage(headerMessage);
      }

      return AiTutorState(
        chatHistory: chatHistory,
        stage: AiTutorStage.init,
        currentThreadId: state.value?.currentThreadId,
        userThreads: state.value?.userThreads ?? [],
      );
    });
  }

  Future<void> _getAnswer(String question) async {
    ChatHistory chatHistory = state.value!.chatHistory;

    final questionMessage = AiMessage.myQuestion(
      message: question,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    final answerMessageHold = AiMessage.aiAnswer(
      message: "",
      date: DateFormat('h:mm a').format(DateTime.now()),
    );

    try {
      await aiRepo.addMessage(questionMessage);
      chatHistory = chatHistory.addMessage(questionMessage);

      final ChatHistory messagesWithProgressHold = chatHistory.addMessage(answerMessageHold);
      state = AsyncValue.data(
        state.value!.copyWith(
          chatHistory: messagesWithProgressHold,
          aiAnsweringOnQuestion: questionMessage,
          stage: AiTutorStage.sentAIAnswerProgress,
        ),
      );

      final answerMessage = AiMessage.aiAnswer(
        message: await aiRepo.sentQuestion(question),
        date: DateFormat('h:mm a').format(DateTime.now()),
      );
      chatHistory = chatHistory.addMessage(answerMessage);
      await aiRepo.addMessage(answerMessage);
      state = AsyncValue.data(state.value!.copyWith(chatHistory: chatHistory, stage: AiTutorStage.sentAIAnswerSuccess));
    } catch (e) {
      if (e is OpenAIServerError) {
        state = AsyncValue.error(e, StackTrace.current);
        FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        return;
      }
      if (e is OpenAIRateLimitError) {
        await _changeTokenAndTryAgainGetAnswer(questionMessage, chatHistory, 1);
        return;
      }
      if (e is OpenAIAuthError) {
        await _changeTokenAndTryAgainGetAnswer(questionMessage, chatHistory, 1);
        return;
      }
      if (e is RequestError) {
        state = AsyncValue.error(e, StackTrace.current);
        FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        return;
      }
      state = AsyncValue.error(e, StackTrace.current);
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  Future<void> _tryAgainSendQuestion(AiMessage question, ChatHistory chatHistory) async {
    final answerMessageHold = AiMessage.aiAnswer(
      message: "",
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    final ChatHistory messagesWithProgressHold = chatHistory.addMessage(answerMessageHold);
    state = AsyncValue.data(
      state.value!.copyWith(chatHistory: messagesWithProgressHold, stage: AiTutorStage.sentAIAnswerProgress),
    );
    await _changeTokenAndTryAgainGetAnswer(question, chatHistory, 1);
  }

  Future<void> _changeTokenAndTryAgainGetAnswer(
    AiMessage question,
    ChatHistory chatHistory,
    int countRepeat, [
    Object? error,
  ]) async {
    if (await connectivity.isConnected()) {
      try {
        aiRepo.changeAiToken();
        final answerMessage = AiMessage.aiAnswer(
          message: await aiRepo.sentQuestion(question.message),
          date: DateFormat('h:mm a').format(DateTime.now()),
        );
        await aiRepo.addMessage(answerMessage);
        state = AsyncValue.data(
          state.value!.copyWith(
            chatHistory: chatHistory.addMessage(answerMessage),
            stage: AiTutorStage.sentAIAnswerSuccess,
          ),
        );
      } catch (e) {
        if (countRepeat < 3) {
          await _changeTokenAndTryAgainGetAnswer(question, chatHistory, countRepeat + 1, e);
        } else {
          state = AsyncValue.error(e, StackTrace.current);
          FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        }
      }
    } else {
      state = AsyncValue.error(error ??= LocalError.noInternetConnection, StackTrace.current);
    }
  }

  // Assistants API v2 methods
  Future<void> _initializeAssistant() async {
    state = const AsyncValue.loading();
    try {
      await aiRepo.setupAssistant();
      final threads = await aiRepo.getUserThreads();
      final currentThreadId = threads.isNotEmpty ? threads.last : null;

      // Загружаем историю из последнего thread если он есть
      ChatHistory chatHistory;
      if (currentThreadId != null) {
        chatHistory = await aiRepo.getThreadHistory(currentThreadId);
      } else {
        chatHistory = ChatHistory.withHeaderMessage(aiRepo.settings.headerMessage);
      }

      state = AsyncValue.data(
        state.value!.copyWith(
          stage: AiTutorStage.init,
          userThreads: threads,
          currentThreadId: currentThreadId,
          chatHistory: chatHistory,
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  Future<void> _createNewThread() async {
    state = const AsyncValue.loading();
    try {
      final threadId = await aiRepo.createThread();
      final threads = await aiRepo.getUserThreads();
      final ChatHistory chatHistory = ChatHistory.withHeaderMessage(aiRepo.settings.headerMessage);
      state = AsyncValue.data(
        state.value!.copyWith(
          stage: AiTutorStage.init,
          currentThreadId: threadId,
          userThreads: threads,
          chatHistory: chatHistory,
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  Future<void> _selectThread(String threadId) async {
    state = const AsyncValue.loading();
    try {
      // Загружаем историю сообщений из выбранного thread
      final ChatHistory chatHistory = await aiRepo.getThreadHistory(threadId);
      state = AsyncValue.data(
        state.value!.copyWith(stage: AiTutorStage.init, currentThreadId: threadId, chatHistory: chatHistory),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> _deleteThread(String threadId) async {
    try {
      await aiRepo.deleteThread(threadId);
      final threads = await aiRepo.getUserThreads();
      String? newCurrentThreadId = state.value!.currentThreadId;
      ChatHistory chatHistory = state.value!.chatHistory;

      if (state.value!.currentThreadId == threadId) {
        newCurrentThreadId = null;
        chatHistory = ChatHistory.withHeaderMessage(aiRepo.settings.headerMessage);
      }

      state = AsyncValue.data(
        state.value!.copyWith(currentThreadId: newCurrentThreadId, userThreads: threads, chatHistory: chatHistory),
      );
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> _sendQuestionToAssistant(String question) async {
    if (state.value!.currentThreadId == null) {
      await _createNewThread();
      if (state.value!.currentThreadId == null) return;
    }

    ChatHistory chatHistory = state.value!.chatHistory;

    final questionMessage = AiMessage.myQuestion(
      message: question,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );

    chatHistory = chatHistory.addMessage(questionMessage);
    await aiRepo.addMessage(questionMessage);

    // Add empty message for streaming
    final streamingMessage = AiMessage.aiAnswer(
      message: '',
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    chatHistory = chatHistory.addMessage(streamingMessage);

    state = AsyncValue.data(
      state.value!.copyWith(
        chatHistory: chatHistory,
        stage: AiTutorStage.streamingResponse,
        isStreaming: true,
        streamingResponse: '',
        aiAnsweringOnQuestion: questionMessage,
      ),
    );

    try {
      _currentStreamingMessage = '';
      _streamSubscription?.cancel();

      final stream = aiRepo.streamAssistantResponse(state.value!.currentThreadId!, question);

      final completer = Completer<void>();

      _streamSubscription = stream.listen(
        (chunk) {
          _currentStreamingMessage += chunk;
          handlerEvent(StreamResponseUpdateEvent(chunk: _currentStreamingMessage));
        },
        onDone: () {
          completer.complete();
        },
        onError: (Object error) {
          completer.completeError(error);
        },
      );

      await completer.future;

      // Сохраняем финальное сообщение
      final finalMessage = AiMessage.aiAnswer(
        message: _currentStreamingMessage,
        date: DateFormat('h:mm a').format(DateTime.now()),
      );

      await aiRepo.addMessage(finalMessage);

      // Обновляем последнее сообщение в списке
      chatHistory = chatHistory.updateLastMessage(finalMessage);

      state = AsyncValue.data(
        state.value!.copyWith(
          chatHistory: chatHistory,
          stage: AiTutorStage.sentAIAnswerSuccess,
          isStreaming: false,
          streamingResponse: null,
          aiAnsweringOnQuestion: null,
        ),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  void _updateStreamingResponse(String chunk) {
    if (state.value!.isStreaming) {
      ChatHistory chatHistory = state.value!.chatHistory;
      if (chatHistory.messages.isNotEmpty) {
        chatHistory = chatHistory.updateLastMessage(
          AiMessage.aiAnswer(
            message: chunk,
            date: chatHistory.messages[chatHistory.messages.length - 1].date,
          ),
        );
        state = AsyncValue.data(state.value!.copyWith(chatHistory: chatHistory, streamingResponse: chunk));
      }
    }
  }
}
