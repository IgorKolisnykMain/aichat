import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'ai_message.freezed.dart';
part 'ai_message.g.dart';

@freezed
sealed class AiMessage with _$AiMessage {
  const AiMessage._();

  const factory AiMessage._base({
    required String message,
    required AiChatItemType type,
    required String date,
    String? customPrompt,
  }) = _AiMessage;

  factory AiMessage.header({required String message}) =>
      AiMessage._base(message: message, type: AiChatItemType.header, date: DateFormat('h:mm a').format(DateTime.now()));

  factory AiMessage.myQuestion({
    required String message,
    String? date,
    String? customPrompt,
  }) => AiMessage._base(
    message: message,
    type: AiChatItemType.myQuestion,
    date: date ?? DateFormat('h:mm a').format(DateTime.now()),
    customPrompt: customPrompt,
  );

  factory AiMessage.aiAnswer({
    required String message,
    String? date,
  }) => AiMessage._base(
    message: message,
    type: AiChatItemType.aiAnswer,
    date: date ?? DateFormat('h:mm a').format(DateTime.now()),
  );

  factory AiMessage.loadingMock() => AiMessage._base(
    message: '',
    type: AiChatItemType.loadingMock,
    date: DateFormat('h:mm a').format(DateTime.now()),
  );

  factory AiMessage.fromJson(Map<String, dynamic> json) => _$AiMessageFromJson(json);
}
