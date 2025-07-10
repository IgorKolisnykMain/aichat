import 'dart:async';

import 'package:aichat/src/features/ai_chat/data/repository/ai_tutor_repo_impl.dart';
import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message/ai_message.dart';
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

    return const AiTutorState(stage: AiTutorStage.initial, messages: [], streamingResponse: '');
  }

  void dispose() {
    _streamSubscription?.cancel();
  }

  void handlerEvent(AiTutorEvent event) => switch (event) {
    LoadHistoryEvent() => _loadHistory(),
    SendQuestionEvent(query: final query) => _getAnswer(query),
    TryAgainSendQuestionEvent() =>
      state.value!.aiAnsweringOnQuestion != null
          ? _tryAgainSendQuestion(state.value!.aiAnsweringOnQuestion!, List.of(state.value!.messages))
          : Future.value(),
    // Assistants API v2 handlers
    InitializeAssistantEvent() => _initializeAssistant(),
    CreateNewThreadEvent() => _createNewThread(),
    SelectThreadEvent(threadId: final threadId) => _selectThread(threadId),
    DeleteThreadEvent(threadId: final threadId) => _deleteThread(threadId),
    SendQuestionToAssistantEvent(query: final query) => _sendQuestionToAssistant(query),
    StreamResponseUpdateEvent(chunk: final chunk) => _updateStreamingResponse(chunk),
  };

  AiMessage _getHeaderAiMessage() => AiMessage(
    message: aiRepo.settings.headerMessage,
    type: AiChatItemType.header,
    date: DateFormat('h:mm a').format(DateTime.now()),
  );

  Future<void> _loadHistory() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final List<AiMessage> messages = [_getHeaderAiMessage()];
      messages.addAll(await aiRepo.getChatHistory());
      return AiTutorState(messages: messages, stage: AiTutorStage.init);
    });
  }

  Future<void> _getAnswer(String question) async {
    final List<AiMessage> messages = List.of(state.value!.messages);

    final questionMessage = AiMessage(
      message: question,
      type: AiChatItemType.myQuestion,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    final answerMessageHold = AiMessage(
      message: "",
      type: AiChatItemType.aiAnswer,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );

    try {
      await aiRepo.addMessage(questionMessage);
      messages.add(questionMessage);

      final List<AiMessage> messagesWithProgressHold = List.of(messages);
      messagesWithProgressHold.add(answerMessageHold);
      state = AsyncValue.data(
        state.value!.copyWith(
          messages: messagesWithProgressHold,
          aiAnsweringOnQuestion: questionMessage,
          stage: AiTutorStage.sentAIAnswerProgress,
        ),
      );

      final answerMessage = AiMessage(
        message: await aiRepo.sentQuestion(question),
        type: AiChatItemType.aiAnswer,
        date: DateFormat('h:mm a').format(DateTime.now()),
      );
      messages.add(answerMessage);
      await aiRepo.addMessage(answerMessage);
      state = AsyncValue.data(state.value!.copyWith(messages: messages, stage: AiTutorStage.sentAIAnswerSuccess));
    } catch (e) {
      if (e is OpenAIServerError) {
        state = AsyncValue.error(e, StackTrace.current);
        FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        return;
      }
      if (e is OpenAIRateLimitError) {
        await _changeTokenAndTryAgainGetAnswer(questionMessage, messages, 1);
        return;
      }
      if (e is OpenAIAuthError) {
        await _changeTokenAndTryAgainGetAnswer(questionMessage, messages, 1);
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

  Future<void> _tryAgainSendQuestion(AiMessage question, List<AiMessage> messages) async {
    final answerMessageHold = AiMessage(
      message: "",
      type: AiChatItemType.aiAnswer,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    final List<AiMessage> messagesWithProgressHold = List.of(state.value!.messages);
    messagesWithProgressHold.add(answerMessageHold);
    state = AsyncValue.data(
      state.value!.copyWith(messages: messagesWithProgressHold, stage: AiTutorStage.sentAIAnswerProgress),
    );
    await _changeTokenAndTryAgainGetAnswer(question, messages, 1);
  }

  Future<void> _changeTokenAndTryAgainGetAnswer(
    AiMessage question,
    List<AiMessage> messages,
    int countRepeat, [
    Object? error,
  ]) async {
    if (await connectivity.isConnected()) {
      try {
        aiRepo.changeAiToken();
        final answerMessage = AiMessage(
          message: await aiRepo.sentQuestion(question.message),
          type: AiChatItemType.aiAnswer,
          date: DateFormat('h:mm a').format(DateTime.now()),
        );
        messages.add(answerMessage);
        await aiRepo.addMessage(answerMessage);
        state = AsyncValue.data(state.value!.copyWith(messages: messages, stage: AiTutorStage.sentAIAnswerSuccess));
      } catch (e) {
        if (countRepeat < 3) {
          await _changeTokenAndTryAgainGetAnswer(question, messages, countRepeat + 1, e);
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
      state = AsyncValue.data(
        state.value!.copyWith(
          stage: AiTutorStage.init,
          userThreads: threads,
          currentThreadId: threads.isNotEmpty ? threads.last : null,
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
      final List<AiMessage> messages = [_getHeaderAiMessage()];
      state = AsyncValue.data(
        state.value!.copyWith(
          stage: AiTutorStage.init,
          currentThreadId: threadId,
          userThreads: threads,
          messages: messages,
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
      // TODO: Load message history from thread via API
      final List<AiMessage> messages = [_getHeaderAiMessage()];
      state = AsyncValue.data(
        state.value!.copyWith(stage: AiTutorStage.init, currentThreadId: threadId, messages: messages),
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
      List<AiMessage> messages = state.value!.messages;

      if (state.value!.currentThreadId == threadId) {
        newCurrentThreadId = null;
        messages = [_getHeaderAiMessage()];
      }

      state = AsyncValue.data(
        state.value!.copyWith(currentThreadId: newCurrentThreadId, userThreads: threads, messages: messages),
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

    List<AiMessage> messages = List.of(state.value!.messages);

    final questionMessage = AiMessage(
      message: question,
      type: AiChatItemType.myQuestion,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );

    messages.add(questionMessage);
    await aiRepo.addMessage(questionMessage);

    // Add empty message for streaming
    final streamingMessage = AiMessage(
      message: '',
      type: AiChatItemType.aiAnswer,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    messages.add(streamingMessage);

    state = AsyncValue.data(
      state.value!.copyWith(
        messages: messages,
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
      final finalMessage = AiMessage(
        message: _currentStreamingMessage,
        type: AiChatItemType.aiAnswer,
        date: DateFormat('h:mm a').format(DateTime.now()),
      );

      await aiRepo.addMessage(finalMessage);

      // Обновляем последнее сообщение в списке
      messages = List.of(state.value!.messages);
      messages[messages.length - 1] = finalMessage;

      state = AsyncValue.data(
        state.value!.copyWith(
          messages: messages,
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
      final List<AiMessage> messages = List.of(state.value!.messages);
      if (messages.isNotEmpty) {
        messages[messages.length - 1] = AiMessage(
          message: chunk,
          type: AiChatItemType.aiAnswer,
          date: messages[messages.length - 1].date,
        );
        state = AsyncValue.data(state.value!.copyWith(messages: messages, streamingResponse: chunk));
      }
    }
  }
}
