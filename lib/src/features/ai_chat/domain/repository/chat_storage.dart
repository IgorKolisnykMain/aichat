import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';

abstract class ChatStorage {
  Future<ChatHistory> fetchChatHistory();
  Stream<ChatHistory> watchChatHistory();
  Future<void> addMessage(AiMessage message);

  Future<ChatHistory> fetchThreadHistory(String threadId);
  Stream<ChatHistory> watchThreadHistory(String threadId);
  Future<String> createThread();
  Future<void> deleteThread(String threadId);
}
