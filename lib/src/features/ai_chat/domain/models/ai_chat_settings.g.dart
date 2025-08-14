// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiChatSettings _$AiChatSettingsFromJson(Map<String, dynamic> json) => _AiChatSettings(
  headerMessage: json['headerMessage'] as String,
  promptChat: json['promptChat'] as String,
  tokens: (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
  usedTokens: (json['usedTokens'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
);

Map<String, dynamic> _$AiChatSettingsToJson(_AiChatSettings instance) => <String, dynamic>{
  'headerMessage': instance.headerMessage,
  'promptChat': instance.promptChat,
  'tokens': instance.tokens,
  'usedTokens': instance.usedTokens,
};
