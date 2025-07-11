import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordRecoveryControllerProvider =
    AsyncNotifierProvider.autoDispose<PasswordRecoveryController, PasswordRecoveryState>(() {
      return PasswordRecoveryController();
    });

class PasswordRecoveryController extends AsyncNotifier<PasswordRecoveryState> {
  late final AuthRepository authFirebaseRep;

  @override
  Future<PasswordRecoveryState> build() async {
    authFirebaseRep = await ref.read(authRepoProvider.future);
    return const PasswordRecoveryState();
  }

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
