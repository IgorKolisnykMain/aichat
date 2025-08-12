import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordRecoveryControllerProvider =
    AsyncNotifierProvider.autoDispose<PasswordRecoveryController, PasswordRecoveryState>(
      PasswordRecoveryController.new,
    );

class PasswordRecoveryController extends AsyncNotifier<PasswordRecoveryState> {
  late AuthRepository authFirebaseRep;

  @override
  Future<PasswordRecoveryState> build() async {
    authFirebaseRep = ref.read(authRepoProvider);
    return const PasswordRecoveryState();
  }

  Future<void> recoverPassword(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await authFirebaseRep.resetPassword(email: email);
      return PasswordRecoveryState(stage: PasswordRecoveryStage.success, email: email);
    });
  }
}
