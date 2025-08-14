// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatHistory _$ChatHistoryFromJson(Map<String, dynamic> json) => _ChatHistory(
  messages: (json['messages'] as List<dynamic>).map((e) => AiMessage.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$ChatHistoryToJson(_ChatHistory instance) => <String, dynamic>{'messages': instance.messages};
