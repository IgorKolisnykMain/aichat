import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_recovery_controller.g.dart';

@riverpod
class PasswordRecoveryController extends _$PasswordRecoveryController {
  late AuthRepository _authFirebaseRep;

  @override
  Future<PasswordRecoveryState> build() async {
    _authFirebaseRep = ref.read(authRepoProvider);
    return const PasswordRecoveryState();
  }

  Future<void> recoverPassword(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authFirebaseRep.resetPassword(email: email);
      return PasswordRecoveryState(stage: PasswordRecoveryStage.success, email: email);
    });
  }
}
