import 'package:aichat/src/core/config/models/app_config/app_config.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_chat_settings.dart';

abstract interface class AppConfigRepository {
  AppConfig get config;

  Future<AiChatSettings> getAiSettings();
}
