import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings.dart';

abstract class AiRepository {
  AiChatSettings get settings;
  
  Future<void> setupAi(String token);
  void changeAiToken(String newToken);
  Future<String> sendQuestion(String question, {String? threadId});
  Stream<String> streamResponse(String question, {String? threadId});
}
