import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/chat_storage.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:intl/intl.dart';

class ChatGptChatStorage implements ChatStorage {
  final OpenAI openAI;
  final String headerMessage;
  final ErrorLogger errorLogger;

  ChatGptChatStorage({
    required this.openAI,
    required this.headerMessage,
    required this.errorLogger,
  });

  void dispose() {
    // No resources to dispose
  }

  @override
  Future<ChatHistory> getChatHistory() async {
    // This method is not used for ChatGPT storage
    // Chat history is retrieved through getThreadHistory
    return ChatHistory.withHeaderMessage(headerMessage);
  }

  @override
  Future<void> addMessage(AiMessage message) async {
    // Messages are automatically saved when using OpenAI threads
    // This method is for compatibility but doesn't need to do anything
    // as messages are saved through the streaming API
    return;
  }

  @override
  Future<String> createThread() async {
    final request = ThreadRequest(
      messages: [], // Empty message list for new thread
    );
    final thread = await openAI.threads.v2.createThread(request: request);
    return thread.id;
  }

  @override
  Future<void> deleteThread(String threadId) => openAI.threads.v2.deleteThread(threadId: threadId);

  @override
  Future<ChatHistory> getThreadHistory(String threadId) async {
    try {
      final messages = await openAI.threads.v2.messages.listMessage(threadId: threadId);
      final List<AiMessage> aiMessages = [];

      // Add header message
      final headerMessageObj = AiMessage.header(message: headerMessage);
      aiMessages.add(headerMessageObj);

      // Convert OpenAI messages to AiMessage (in reverse order for chronology)
      for (final message in messages.data.reversed) {
        if (message.role == 'user' && message.content.isNotEmpty) {
          final content = message.content.first;
          if (content.type == 'text' && content.text?.value != null) {
            aiMessages.add(
              AiMessage.myQuestion(
                message: content.text!.value,
                date: _formatTimestamp(message.createdAt),
              ),
            );
          }
        } else if (message.role == 'assistant' && message.content.isNotEmpty) {
          final content = message.content.first;
          if (content.type == 'text' && content.text?.value != null) {
            aiMessages.add(
              AiMessage.aiAnswer(
                message: content.text!.value,
                date: _formatTimestamp(message.createdAt),
              ),
            );
          }
        }
      }

      return ChatHistory(messages: aiMessages);
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      // If failed to load from thread, return only header
      return ChatHistory.withHeaderMessage(headerMessage);
    }
  }

  String _formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('h:mm a').format(date);
  }
}
