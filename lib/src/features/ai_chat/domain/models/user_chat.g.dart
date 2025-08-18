// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserChat _$UserChatFromJson(Map<String, dynamic> json) => _UserChat(
  assistantId: json['assistantId'] as String,
  chatHistory:
      (json['chatHistory'] as List<dynamic>?)?.map((e) => AiMessage.fromJson(e as Map<String, dynamic>)).toList() ??
      const [],
  threads: (json['threads'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  usedAiTokens: (json['usedAiTokens'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
);

Map<String, dynamic> _$UserChatToJson(_UserChat instance) => <String, dynamic>{
  'assistantId': instance.assistantId,
  'chatHistory': instance.chatHistory,
  'threads': instance.threads,
  'usedAiTokens': instance.usedAiTokens,
};
