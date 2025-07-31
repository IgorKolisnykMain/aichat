import 'package:equatable/equatable.dart';

sealed class AiTutorEvent extends Equatable {
  const AiTutorEvent();

  @override
  List<Object?> get props => [];
}

class SendQuestionEvent extends AiTutorEvent {
  final String query;

  const SendQuestionEvent({required this.query});

  @override
  List<Object?> get props => [query];
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
