import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aichat/domain/models/ai_chat_settings/ai_chat_settings.dart';
import 'package:aichat/domain/models/ai_message/ai_message.dart';

abstract class AiTutorRepo {
  AiChatSettings get settings;

  Future<void> setupAiChat();
  void changeAiToken();

  Future<List<AiMessage>> getChatHistory([Source source = Source.cache]);
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
