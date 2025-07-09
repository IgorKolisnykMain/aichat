// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiMessageImpl _$$AiMessageImplFromJson(Map<String, dynamic> json) => _$AiMessageImpl(
  message: json['message'] as String,
  type: $enumDecode(_$AiChatItemTypeEnumMap, json['type']),
  date: json['date'] as String,
  customPrompt: json['customPrompt'] as String?,
);

Map<String, dynamic> _$$AiMessageImplToJson(_$AiMessageImpl instance) => <String, dynamic>{
  'message': instance.message,
  'type': _$AiChatItemTypeEnumMap[instance.type]!,
  'date': instance.date,
  'customPrompt': instance.customPrompt,
};

const _$AiChatItemTypeEnumMap = {
  AiChatItemType.header: 'header',
  AiChatItemType.myQuestion: 'myQuestion',
  AiChatItemType.aiAnswer: 'aiAnswer',
};
