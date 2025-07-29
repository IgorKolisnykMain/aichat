// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatHistoryImpl _$$ChatHistoryImplFromJson(Map<String, dynamic> json) => _$ChatHistoryImpl(
  messages: (json['messages'] as List<dynamic>).map((e) => AiMessage.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$$ChatHistoryImplToJson(_$ChatHistoryImpl instance) => <String, dynamic>{
  'messages': instance.messages,
};
