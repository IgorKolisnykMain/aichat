import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_message.freezed.dart';
part 'ai_message.g.dart';

@freezed
abstract class AiMessage with _$AiMessage {
  const factory AiMessage({
    required String message,
    required AiChatItemType type,
    required String date,
    String? customPrompt,
  }) = _AiMessage;

  factory AiMessage.fromJson(Map<String, dynamic> json) => _$AiMessageFromJson(json);
}
