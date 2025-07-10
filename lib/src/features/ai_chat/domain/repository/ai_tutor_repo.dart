import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings/ai_chat_settings.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message/ai_message.dart';

abstract class AiTutorRepo {
  AiChatSettings get settings;

  Future<void> setupAiChat();
  void changeAiToken();

  Future<List<AiMessage>> getChatHistory();
  Future<String> sentQuestion(String question);
  Future<void> addMessage(AiMessage message);

  // Assistants API v2 methods
  Future<void> setupAssistant();
  Future<String> createThread();
  Future<void> sendMessageToAssistant(String threadId, String message);
  Stream<String> streamAssistantResponse(String threadId, String message);
  Future<void> deleteThread(String threadId);
  Future<List<String>> getUserThreads();
}
