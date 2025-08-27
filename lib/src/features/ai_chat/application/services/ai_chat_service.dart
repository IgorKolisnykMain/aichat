import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';

abstract class AiChatService {
  Future<void> initialize();

  // Chat history management
  Future<ChatHistory> getChatHistory();
  Future<ChatHistory> getThreadHistory(String threadId);

  // Question handling
  Future<ChatHistory> sendQuestion(String question, {String? threadId});
  Stream<ChatHistory> watchQuestion(String question, {String? threadId});

  // Thread management
  Future<String> createThread();
  Future<void> deleteThread(String threadId);
  Future<List<String>> getUserThreads();
  Stream<List<String>> watchUserThreads();
}
