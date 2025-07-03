import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aichat/domain/enum/ai_chat_item_type.dart';
import 'package:aichat/domain/models/ai_message/ai_message.dart';
import 'package:aichat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/domain/services/connectivity_detector_service.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_event.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_state.dart';
import 'package:intl/intl.dart';

class AiTutorBloc extends Bloc<AiTutorEvent, AiTutorState> {
  final AiTutorRepo aiRepo;
  final ConnectivityDetectorService connectivity;
  StreamSubscription<String>? _streamSubscription;
  String _currentStreamingMessage = '';

  AiTutorBloc(this.aiRepo, this.connectivity) : super(const AiTutorState(stage: AiTutorStage.init, messages: [])) {
    on<AiTutorEvent>(_handler, transformer: sequential());
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  EventHandler<AiTutorEvent, AiTutorState> get _handler =>
      (event, emit) => switch (event) {
        LoadHistoryEvent() => _loadHistory(emit),
        LoadHistoryByQuestionEvent(questionId: final questionId) => _loadHistoryByQuestion(emit, questionId),
        SendQuestionEvent(query: final query) => _getAnswer(emit, query),
        TryAgainSendQuestionEvent() =>
          state.aiAnsweringOnQuestion != null
              ? _tryAgainSendQuestion(emit, state.aiAnsweringOnQuestion!, List.of(state.messages))
              : Future.value(),
        // Assistants API v2 handlers
        InitializeAssistantEvent() => _initializeAssistant(emit),
        CreateNewThreadEvent() => _createNewThread(emit),
        SelectThreadEvent(threadId: final threadId) => _selectThread(emit, threadId),
        DeleteThreadEvent(threadId: final threadId) => _deleteThread(emit, threadId),
        SendQuestionToAssistantEvent(query: final query) => _sendQuestionToAssistant(emit, query),
        StreamResponseUpdateEvent(chunk: final chunk) => _updateStreamingResponse(emit, chunk),
      };

  AiMessage _getHeaderAiMessage() => AiMessage(
    message: aiRepo.settings.headerMessage,
    type: AiChatItemType.header,
    date: DateFormat('h:mm a').format(DateTime.now()),
  );

  Future<void> _loadHistory(Emitter<AiTutorState> emit) async {
    emit(state.copyWith(stage: AiTutorStage.loading));
    final List<AiMessage> messages = [_getHeaderAiMessage()];
    messages.addAll(await aiRepo.getChatHistory());
    emit(state.copyWith(messages: messages, stage: AiTutorStage.init));
  }

  Future<void> _loadHistoryByQuestion(Emitter<AiTutorState> emit, String questionId) async {
    // TODO: Implement loading history by question ID
    await _loadHistory(emit);
  }

  Future<void> _getAnswer(Emitter<AiTutorState> emit, String question) async {
    final List<AiMessage> messages = List.of(state.messages);

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
      emit(
        state.copyWith(
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
      emit(state.copyWith(messages: messages, stage: AiTutorStage.sentAIAnswerSuccess));
    } catch (e) {
      if (e is OpenAIServerError) {
        emit(state.copyWith(messages: messages, stage: AiTutorStage.openAIServerError, error: e));
        FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        return;
      }
      if (e is OpenAIRateLimitError) {
        await _changeTokenAndTryAgainGetAnswer(emit, questionMessage, messages, 1);
        return;
      }
      if (e is OpenAIAuthError) {
        await _changeTokenAndTryAgainGetAnswer(emit, questionMessage, messages, 1);
        return;
      }
      if (e is RequestError) {
        emit(state.copyWith(messages: messages, stage: AiTutorStage.openAIServerError, error: e));
        FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        return;
      }
      emit(state.copyWith(messages: messages, stage: AiTutorStage.openAIServerError, error: e));
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  Future<void> _tryAgainSendQuestion(Emitter<AiTutorState> emit, AiMessage question, List<AiMessage> messages) async {
    final answerMessageHold = AiMessage(
      message: "",
      type: AiChatItemType.aiAnswer,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    final List<AiMessage> messagesWithProgressHold = List.of(state.messages);
    messagesWithProgressHold.add(answerMessageHold);
    emit(state.copyWith(messages: messagesWithProgressHold, stage: AiTutorStage.sentAIAnswerProgress));
    await _changeTokenAndTryAgainGetAnswer(emit, question, messages, 1);
  }

  Future<void> _changeTokenAndTryAgainGetAnswer(
    Emitter<AiTutorState> emit,
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
        emit(state.copyWith(messages: messages, stage: AiTutorStage.sentAIAnswerSuccess));
      } catch (e) {
        if (countRepeat < 3) {
          await _changeTokenAndTryAgainGetAnswer(emit, question, messages, countRepeat + 1, e);
        } else {
          emit(state.copyWith(messages: messages, stage: AiTutorStage.openAIServerError, error: e));
          FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
        }
      }
    } else {
      emit(state.copyWith(messages: messages, stage: AiTutorStage.openAIServerError, error: error));
    }
  }

  // Assistants API v2 methods
  Future<void> _initializeAssistant(Emitter<AiTutorState> emit) async {
    emit(state.copyWith(stage: AiTutorStage.loading));
    try {
      await aiRepo.setupAssistant();
      final threads = await aiRepo.getUserThreads();
      emit(
        state.copyWith(
          stage: AiTutorStage.init,
          userThreads: threads,
          currentThreadId: threads.isNotEmpty ? threads.last : null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(stage: AiTutorStage.openAIServerError, error: e));
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  Future<void> _createNewThread(Emitter<AiTutorState> emit) async {
    emit(state.copyWith(stage: AiTutorStage.creatingThread));
    try {
      final threadId = await aiRepo.createThread();
      final threads = await aiRepo.getUserThreads();
      final List<AiMessage> messages = [_getHeaderAiMessage()];
      emit(
        state.copyWith(stage: AiTutorStage.init, currentThreadId: threadId, userThreads: threads, messages: messages),
      );
    } catch (e) {
      emit(state.copyWith(stage: AiTutorStage.openAIServerError, error: e));
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  Future<void> _selectThread(Emitter<AiTutorState> emit, String threadId) async {
    emit(state.copyWith(stage: AiTutorStage.loading));
    try {
      // TODO: Загрузить историю сообщений из thread через API
      final List<AiMessage> messages = [_getHeaderAiMessage()];
      emit(state.copyWith(stage: AiTutorStage.init, currentThreadId: threadId, messages: messages));
    } catch (e) {
      emit(state.copyWith(stage: AiTutorStage.openAIServerError, error: e));
    }
  }

  Future<void> _deleteThread(Emitter<AiTutorState> emit, String threadId) async {
    try {
      await aiRepo.deleteThread(threadId);
      final threads = await aiRepo.getUserThreads();
      String? newCurrentThreadId = state.currentThreadId;
      List<AiMessage> messages = state.messages;

      if (state.currentThreadId == threadId) {
        newCurrentThreadId = null;
        messages = [_getHeaderAiMessage()];
      }

      emit(state.copyWith(currentThreadId: newCurrentThreadId, userThreads: threads, messages: messages));
    } catch (e) {
      emit(state.copyWith(stage: AiTutorStage.openAIServerError, error: e));
    }
  }

  Future<void> _sendQuestionToAssistant(Emitter<AiTutorState> emit, String question) async {
    if (state.currentThreadId == null) {
      await _createNewThread(emit);
      if (state.currentThreadId == null) return;
    }

    List<AiMessage> messages = List.of(state.messages);

    final questionMessage = AiMessage(
      message: question,
      type: AiChatItemType.myQuestion,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );

    messages.add(questionMessage);
    await aiRepo.addMessage(questionMessage);

    // Добавляем пустое сообщение для streaming
    final streamingMessage = AiMessage(
      message: '',
      type: AiChatItemType.aiAnswer,
      date: DateFormat('h:mm a').format(DateTime.now()),
    );
    messages.add(streamingMessage);

    emit(
      state.copyWith(
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

      final stream = aiRepo.streamAssistantResponse(state.currentThreadId!, question);

      final completer = Completer<void>();

      _streamSubscription = stream.listen(
        (chunk) {
          _currentStreamingMessage += chunk;
          add(StreamResponseUpdateEvent(chunk: _currentStreamingMessage));
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
      messages = List.of(state.messages);
      messages[messages.length - 1] = finalMessage;

      emit(
        state.copyWith(
          messages: messages,
          stage: AiTutorStage.sentAIAnswerSuccess,
          isStreaming: false,
          streamingResponse: null,
          aiAnsweringOnQuestion: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(stage: AiTutorStage.openAIServerError, error: e, isStreaming: false));
      FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: e));
    }
  }

  void _updateStreamingResponse(Emitter<AiTutorState> emit, String chunk) {
    if (state.isStreaming) {
      final List<AiMessage> messages = List.of(state.messages);
      if (messages.isNotEmpty) {
        messages[messages.length - 1] = AiMessage(
          message: chunk,
          type: AiChatItemType.aiAnswer,
          date: messages[messages.length - 1].date,
        );
        emit(state.copyWith(messages: messages, streamingResponse: chunk));
      }
    }
  }
}
