import 'package:equatable/equatable.dart';

sealed class PasswordRecoveryEvent extends Equatable {}

class RecoverPasswordEvent extends PasswordRecoveryEvent {
  final String email;

  RecoverPasswordEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
