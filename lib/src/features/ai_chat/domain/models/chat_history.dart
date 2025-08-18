import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_item_type.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_history.freezed.dart';
part 'chat_history.g.dart';

const String _messagesKey = 'messages';
const String _chatHistoryKey = 'chat_history';

@freezed
abstract class ChatHistory with _$ChatHistory {
  const factory ChatHistory({required List<AiMessage> messages}) = _ChatHistory;

  factory ChatHistory.withHeaderMessage(String headerMessage) =>
      ChatHistory(messages: [AiMessage.header(message: headerMessage)]);

  factory ChatHistory.fromJson(Map<String, dynamic> json) => _$ChatHistoryFromJson(json);

  factory ChatHistory.fromJsonChatHistory(Map<String, dynamic> json) {
    final chatHistory = {_messagesKey: json[_chatHistoryKey]};
    return ChatHistory.fromJson(chatHistory);
  }
}

extension MutableChatHistory on ChatHistory {
  ChatHistory addMessage(AiMessage message) {
    final updatedMessages = List.of(messages);
    //todo Remove this condition after implementing retry send message
    if (messages.isNotEmpty && messages.last == message) {
      return this;
    }
    updatedMessages.add(message);
    return copyWith(messages: updatedMessages);
  }

  ChatHistory addHeaderMessage(AiMessage headerMessage) {
    final List<AiMessage> messages = [headerMessage];
    messages.addAll(this.messages);
    return copyWith(messages: messages);
  }

  ChatHistory updateLastMessage(AiMessage message) {
    final List<AiMessage> messages = List.of(this.messages);
    messages[messages.length - 1] = message;
    return copyWith(messages: messages);
  }

  ChatHistory addLoadingMockMessage() {
    final List<AiMessage> messages = List.of(this.messages);
    messages.add(const AiMessage.loadingMock());
    return copyWith(messages: messages);
  }

  ChatHistory removeLoadingMockMessage() {
    final List<AiMessage> messages = List.of(this.messages);
    messages.removeWhere((message) => message.type == AiChatItemType.loadingMock);
    return copyWith(messages: messages);
  }
}

extension ChatHistoryExtension on ChatHistory {
  Map<String, dynamic> toJsonChatHistory() {
    return {_chatHistoryKey: messages.map((message) => message.toJson()).toList()};
  }

  List<AiMessage> toMessagesList() => List.of(messages);
}
