import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_chat.freezed.dart';
part 'user_chat.g.dart';

typedef AssistantId = String;

@freezed
abstract class UserChat with _$UserChat {
  const factory UserChat({
    required AssistantId assistantId,
    @Default([]) List<AiMessage> chatHistory,
    @Default([]) List<String> threads,
    @Default([]) List<String> usedAiTokens,
  }) = _UserChat;

  factory UserChat.fromJson(Map<String, dynamic> json) => _$UserChatFromJson(json);
}

extension MutableUserChat on UserChat {
  UserChat addThreadId(String threadId) {
    return copyWith(threads: [...threads, threadId]);
  }
}
