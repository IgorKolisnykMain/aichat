import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_state.freezed.dart';

@freezed
class SignState with _$SignState {
  const factory SignState({required SignStage stage}) = _SignState;
}

enum SignStage { init, signInSuccess, signUpSuccess, sendResetPassword }
