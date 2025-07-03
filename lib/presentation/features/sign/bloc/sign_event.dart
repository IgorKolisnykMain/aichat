import 'package:equatable/equatable.dart';

sealed class SignEvent extends Equatable {}

class SignViaAppleEvent extends SignEvent {
  @override
  List<Object?> get props => [];
}

class SignViaGoogleEvent extends SignEvent {
  @override
  List<Object?> get props => [];
}

class SignViaAnonymous extends SignEvent {
  @override
  List<Object?> get props => [];
}

class SignUpViaEmailEvent extends SignEvent {
  final String email;
  final String password;

  SignUpViaEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignInViaEmailEvent extends SignEvent {
  final String email;
  final String password;

  SignInViaEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
