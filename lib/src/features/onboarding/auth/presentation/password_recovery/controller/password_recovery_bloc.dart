import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_event.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordRecoveryBloc extends Bloc<PasswordRecoveryEvent, PasswordRecoveryState> {
  final AuthRepository authFirebaseRep;
  PasswordRecoveryBloc(this.authFirebaseRep) : super(const PasswordRecoveryState()) {
    on<RecoverPasswordEvent>(_handler, transformer: sequential());
  }

  EventHandler<PasswordRecoveryEvent, PasswordRecoveryState> get _handler =>
      (event, emit) => switch (event) {
        RecoverPasswordEvent(email: final email) => _recoverPassword(emit, email),
      };

  Future<void> _recoverPassword(Emitter<PasswordRecoveryState> emit, String email) async {
    emit(state.copyWith(stage: PasswordRecoveryStage.loading));

    try {
      await authFirebaseRep.resetPassword(email: email);
      emit(state.copyWith(stage: PasswordRecoveryStage.success, email: email));
    } catch (e) {
      emit(state.copyWith(stage: PasswordRecoveryStage.error));
    }
  }
}
