import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_event.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordRecoveryBloc extends Bloc<PasswordRecoveryEvent, PasswordRecoveryState> {
  final AuthFirebaseRepository authFirebaseRep;
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
