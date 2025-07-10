import 'package:equatable/equatable.dart';

sealed class AiTutorEvent extends Equatable {
  const AiTutorEvent();

  @override
  List<Object?> get props => [];
}

class LoadHistoryEvent extends AiTutorEvent {
  @override
  List<Object?> get props => [];
}

class SendQuestionEvent extends AiTutorEvent {
  final String query;

  const SendQuestionEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class TryAgainSendQuestionEvent extends AiTutorEvent {
  const TryAgainSendQuestionEvent();

  @override
  List<Object?> get props => [];
}

// Assistants API v2 events
class InitializeAssistantEvent extends AiTutorEvent {
  const InitializeAssistantEvent();

  @override
  List<Object?> get props => [];
}

class CreateNewThreadEvent extends AiTutorEvent {
  const CreateNewThreadEvent();

  @override
  List<Object?> get props => [];
}

class SelectThreadEvent extends AiTutorEvent {
  final String threadId;

  const SelectThreadEvent({required this.threadId});

  @override
  List<Object?> get props => [threadId];
}

class DeleteThreadEvent extends AiTutorEvent {
  final String threadId;

  const DeleteThreadEvent({required this.threadId});

  @override
  List<Object?> get props => [threadId];
}

class SendQuestionToAssistantEvent extends AiTutorEvent {
  final String query;

  const SendQuestionToAssistantEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class StreamResponseUpdateEvent extends AiTutorEvent {
  final String chunk;

  const StreamResponseUpdateEvent({required this.chunk});

  @override
  List<Object?> get props => [chunk];
}
