import 'package:aichat/src/features/ai_chat/domain/models/ai_message/ai_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_tutor_state.freezed.dart';

@freezed
class AiTutorState with _$AiTutorState {
  const factory AiTutorState({
    required AiTutorStage stage,
    required List<AiMessage> messages,
    AiMessage? aiAnsweringOnQuestion,
    String? currentThreadId,
    @Default([]) List<String> userThreads,
    String? streamingResponse,
    @Default(false) bool isStreaming,
  }) = _AiTutorState;
}

enum AiTutorStage {
  init,
  myQuestionSent,
  sentAIAnswerProgress,
  sentAIAnswerSuccess,
  openAIServerError,
  creatingThread,
  streamingResponse,
  initial,
}
