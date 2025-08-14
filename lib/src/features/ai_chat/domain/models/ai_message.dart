import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/utils/date_time/current_date_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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
    String? date,
    String? customPrompt,
  }) = AiQuestionMessage;

  const factory AiMessage.aiAnswer({
    required String message,
    String? date,
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

  String get date => map(
    header: (_) => DateFormat('h:mm a').format(currentDate),
    myQuestion: (msg) => msg.date ?? DateFormat('h:mm a').format(currentDate),
    aiAnswer: (msg) => msg.date ?? DateFormat('h:mm a').format(currentDate),
    loadingMock: (_) => DateFormat('h:mm a').format(currentDate),
  );
}
