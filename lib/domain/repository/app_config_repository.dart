import 'package:aichat/domain/model/app_config/app_config.dart';
import 'package:aichat/domain/models/ai_chat_settings/ai_chat_settings.dart';

abstract interface class AppConfigRepository {
  AppConfig get config;

  Future<AiChatSettings> getAiSettings();
}
