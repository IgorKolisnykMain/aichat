// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiChatSettingsImpl _$$AiChatSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AiChatSettingsImpl(
      headerMessage: json['headerMessage'] as String,
      promptChat: json['promptChat'] as String,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      usedTokens:
          (json['usedTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AiChatSettingsImplToJson(
  _$AiChatSettingsImpl instance,
) => <String, dynamic>{
  'headerMessage': instance.headerMessage,
  'promptChat': instance.promptChat,
  'tokens': instance.tokens,
  'usedTokens': instance.usedTokens,
};
