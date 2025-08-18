import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/utils/converters/timestamp_nullable_converter.dart';
import 'package:aichat/src/utils/date_time/current_date_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_message.freezed.dart';
part 'ai_message.g.dart';

@freezed
sealed class AiMessage with _$AiMessage {
  const AiMessage._();

  const factory AiMessage.header({
    required String message,
  }) = AiHeaderMessage;

  const factory AiMessage.myQuestion({
    required String message,
    @TimestampNullableConverter() DateTime? date,
    String? customPrompt,
  }) = AiQuestionMessage;

  const factory AiMessage.aiAnswer({
    required String message,
    @TimestampNullableConverter() DateTime? date,
  }) = AiAnswerMessage;

  const factory AiMessage.loadingMock({
    @Default('') String message,
  }) = AiLoadingMessage;

  factory AiMessage.fromJson(Map<String, dynamic> json) => _$AiMessageFromJson(json);
}

extension AiMessageExtension on AiMessage {
  AiChatItemType get type => map(
    header: (_) => AiChatItemType.header,
    myQuestion: (_) => AiChatItemType.myQuestion,
    aiAnswer: (_) => AiChatItemType.aiAnswer,
    loadingMock: (_) => AiChatItemType.loadingMock,
  );

  DateTime get date => map(
    header: (_) => currentDate,
    myQuestion: (msg) => msg.date ?? currentDate,
    aiAnswer: (msg) => msg.date ?? currentDate,
    loadingMock: (_) => currentDate,
  );
}
