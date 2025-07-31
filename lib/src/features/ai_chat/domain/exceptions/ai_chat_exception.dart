import 'package:aichat/src/features/ai_chat/domain/enums/ai_chat_error.dart';

class AiChatException implements Exception {
  final AiChatError error;
  final String? details;
  final Object? originalException;

  const AiChatException({
    required this.error,
    this.details,
    this.originalException,
  });

  @override
  String toString() {
    if (details != null) {
      return '${error.message} Details: $details';
    }
    return error.message;
  }
}
