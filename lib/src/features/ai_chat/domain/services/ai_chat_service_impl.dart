import 'dart:async';

import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/exceptions/models/default_exeption.dart';
import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_error.dart';
import 'package:aichat/src/features/ai_chat/domain/exceptions/ai_chat_exception.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_repository.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_token_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/chat_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/thread_id_storage.dart';
import 'package:aichat/src/features/ai_chat/domain/services/ai_chat_service.dart';
import 'package:aichat/src/utils/connection/domain/services/connectivity_detector_service.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

class AiChatServiceImpl implements AiChatService {
  final AiRepository _aiRepository;
  final ChatStorage _chatStorage;
  final AITokenStorage _tokenStorage;
  final ThreadIdStorage _threadIdStorage;
  final ConnectivityDetectorService _connectivity;
  final ErrorLogger _errorLogger;

  AiChatServiceImpl({
    required AiRepository aiRepository,
    required ChatStorage chatStorage,
    required AITokenStorage tokenStorage,
    required ThreadIdStorage threadIdStorage,
    required ConnectivityDetectorService connectivity,
    required ErrorLogger errorLogger,
  }) : _aiRepository = aiRepository,
       _chatStorage = chatStorage,
       _tokenStorage = tokenStorage,
       _threadIdStorage = threadIdStorage,
       _connectivity = connectivity,
       _errorLogger = errorLogger;

  @override
  Future<void> initialize() async {
    // Setup AI with current token
    final usedTokens = await _tokenStorage.getUsedTokens();
    final currentToken = _getAvailableToken(usedTokens);
    await _aiRepository.setupAi(currentToken);
  }

  @override
  Future<ChatHistory> getChatHistory() async => await _chatStorage.getChatHistory();

  @override
  Future<ChatHistory> getThreadHistory(String threadId) => _chatStorage.getThreadHistory(threadId);

  @override
  Future<ChatHistory> sendQuestion(String question, {String? threadId}) async {
    final questionMessage = AiMessage.myQuestion(message: question);
    await _chatStorage.addMessage(questionMessage);

    try {
      final answer = await _aiRepository.sendQuestion(question, threadId: threadId);
      final answerMessage = AiMessage.aiAnswer(message: answer);
      await _chatStorage.addMessage(answerMessage);

      return threadId != null ? await getThreadHistory(threadId) : await getChatHistory();
    } catch (e) {
      _errorLogger.logError(e, StackTrace.current);
      await _handleAiError(e, questionMessage, threadId, 1);
      rethrow;
    }
  }

  Future<void> _handleAiError(Object error, AiMessage questionMessage, String? threadId, int retryCount) async {
    FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(exception: error));

    // For rate limit and auth errors, try retry if connected
    if (error is OpenAIRateLimitError || error is OpenAIAuthError) {
      if (await _connectivity.isConnected()) {
        await _sendQuestionWithRetry(questionMessage.message, questionMessage, threadId, retryCount);
      } else {
        throw const AiChatException(error: AiChatError.noInternetConnection);
      }
    } else {
      // For all other errors, convert to AiChatException and throw
      throw _convertToAiChatException(error);
    }
  }

  Future<void> _sendQuestionWithRetry(
    String question,
    AiMessage originalQuestion,
    String? threadId,
    int retryCount,
  ) async {
    try {
      await _changeToken();
      final answer = await _aiRepository.sendQuestion(question, threadId: threadId);
      final answerMessage = AiMessage.aiAnswer(message: answer);
      await _chatStorage.addMessage(answerMessage);
    } catch (e) {
      if (retryCount < 3) {
        await _sendQuestionWithRetry(question, originalQuestion, threadId, retryCount + 1);
      } else {
        // After maximum retries, log and re-throw for _handleAiError to handle
        _errorLogger.logError(e, StackTrace.current);
        throw _convertToAiChatException(e);
      }
    }
  }

  @override
  Stream<ChatHistory> watchQuestion(String question, {String? threadId}) async* {
    final questionMessage = AiMessage.myQuestion(message: question);
    await _chatStorage.addMessage(questionMessage);

    // Get current history with added question
    ChatHistory currentHistory = threadId != null ? await getThreadHistory(threadId) : await getChatHistory();

    // Add empty message for streaming
    const streamingMessage = AiMessage.aiAnswer(message: '');
    currentHistory = currentHistory.addMessage(streamingMessage);
    yield currentHistory;

    String completeResponse = '';
    final stream = _aiRepository.watchResponse(question, threadId: threadId);

    await for (final chunk in stream) {
      completeResponse = chunk;

      // Update last message with current response
      final updatedMessage = AiMessage.aiAnswer(message: completeResponse);
      currentHistory = currentHistory.updateLastMessage(updatedMessage);
      yield currentHistory;
    }

    // Save final message
    final finalMessage = AiMessage.aiAnswer(message: completeResponse);
    await _chatStorage.addMessage(finalMessage);

    // Return final history
    yield threadId != null ? await getThreadHistory(threadId) : await getChatHistory();
  }

  @override
  Future<String> createThread() async {
    final threadId = await _chatStorage.createThread();
    await _threadIdStorage.addThreadId(threadId);
    return threadId;
  }

  @override
  Future<void> deleteThread(String threadId) async {
    await _chatStorage.deleteThread(threadId);
    await _threadIdStorage.removeThreadId(threadId);
  }

  @override
  Future<List<String>> getUserThreads() async {
    return await _threadIdStorage.getUserThreadIds();
  }

  /// Converts various error types to AiChatException
  AiChatException _convertToAiChatException(Object error) {
    if (error is OpenAIRateLimitError) {
      return const AiChatException(error: AiChatError.rateLimitExceeded);
    } else if (error is OpenAIAuthError) {
      return const AiChatException(error: AiChatError.authenticationFailed);
    } else if (error is OpenAIServerError) {
      return AiChatException(error: AiChatError.serverError, originalException: error);
    } else if (error is RequestError) {
      return AiChatException(error: AiChatError.requestError, originalException: error);
    } else if (error == NoInternetException()) {
      return const AiChatException(error: AiChatError.noInternetConnection);
    } else {
      return AiChatException(error: AiChatError.unknown, originalException: error);
    }
  }

  String _getAvailableToken(List<String> usedTokens) {
    final allTokens = _aiRepository.settings.tokens;

    final availableTokens = allTokens.where((token) => !usedTokens.contains(token)).toList();
    return availableTokens.isNotEmpty ? availableTokens.first : allTokens.first;
  }

  Future<void> _changeToken() async {
    final usedTokens = await _tokenStorage.getUsedTokens();
    final allTokens = _aiRepository.settings.tokens;

    if (allTokens.length > usedTokens.length) {
      final availableTokens = allTokens.where((token) => !usedTokens.contains(token)).toList();
      final newToken = availableTokens.first;

      // No casting! Just call the interface method
      _aiRepository.changeAiToken(newToken);

      final updatedUsedTokens = [...usedTokens, newToken];
      await _tokenStorage.updateUsedTokens(updatedUsedTokens);
    } else {
      // Reset used tokens and use first token
      _aiRepository.changeAiToken(allTokens.first);
      await _tokenStorage.updateUsedTokens([allTokens.first]);
    }
  }
}
