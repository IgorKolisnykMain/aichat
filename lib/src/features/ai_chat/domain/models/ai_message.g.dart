// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiHeaderMessage _$AiHeaderMessageFromJson(Map<String, dynamic> json) => AiHeaderMessage(
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AiHeaderMessageToJson(AiHeaderMessage instance) => <String, dynamic>{
  'message': instance.message,
  'runtimeType': instance.$type,
};

AiQuestionMessage _$AiQuestionMessageFromJson(Map<String, dynamic> json) => AiQuestionMessage(
  message: json['message'] as String,
  date: json['date'] as String?,
  customPrompt: json['customPrompt'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AiQuestionMessageToJson(AiQuestionMessage instance) => <String, dynamic>{
  'message': instance.message,
  'date': instance.date,
  'customPrompt': instance.customPrompt,
  'runtimeType': instance.$type,
};

AiAnswerMessage _$AiAnswerMessageFromJson(Map<String, dynamic> json) => AiAnswerMessage(
  message: json['message'] as String,
  date: json['date'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AiAnswerMessageToJson(AiAnswerMessage instance) => <String, dynamic>{
  'message': instance.message,
  'date': instance.date,
  'runtimeType': instance.$type,
};

AiLoadingMessage _$AiLoadingMessageFromJson(Map<String, dynamic> json) => AiLoadingMessage(
  message: json['message'] as String? ?? '',
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AiLoadingMessageToJson(AiLoadingMessage instance) => <String, dynamic>{
  'message': instance.message,
  'runtimeType': instance.$type,
};
