import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_recovery_state.freezed.dart';

@freezed
abstract class PasswordRecoveryState with _$PasswordRecoveryState {
  const factory PasswordRecoveryState({
    @Default(PasswordRecoveryStage.init) PasswordRecoveryStage stage,
    @Default('') String email,
  }) = _PasswordRecoveryState;
}

enum PasswordRecoveryStage { init, success }
