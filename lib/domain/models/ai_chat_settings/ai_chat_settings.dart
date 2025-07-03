import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_chat_settings.freezed.dart';
part 'ai_chat_settings.g.dart';

@freezed
abstract class AiChatSettings with _$AiChatSettings {
  const factory AiChatSettings({
    required String headerMessage,
    required String promptChat,
    required List<String> tokens,
    @Default([]) List<String> usedTokens,
  }) = _AiChatSettings;

  factory AiChatSettings.fromJson(Map<String, dynamic> json) => _$AiChatSettingsFromJson(json);
}
