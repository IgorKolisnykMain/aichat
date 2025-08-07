import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final passwordRecoveryControllerProvider =
    StateNotifierProvider.autoDispose<PasswordRecoveryController, AsyncValue<PasswordRecoveryState>>((ref) {
      final authFirebaseRep = ref.read(authRepoProvider);
      return PasswordRecoveryController(authFirebaseRep);
    });

class PasswordRecoveryController extends StateNotifier<AsyncValue<PasswordRecoveryState>> {
  final AuthRepository authFirebaseRep;

  PasswordRecoveryController(this.authFirebaseRep) : super(const AsyncValue.data(PasswordRecoveryState()));

  Future<void> recoverPassword(String email) async {
    state = const AsyncValue.loading();

    try {
      await authFirebaseRep.resetPassword(email: email);
      state = AsyncValue.data(PasswordRecoveryState(stage: PasswordRecoveryStage.success, email: email));
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
