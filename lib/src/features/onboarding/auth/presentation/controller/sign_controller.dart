import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_sync_service.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signControllerProvider = AsyncNotifierProvider.autoDispose<SignController, SignState>(SignController.new);

class SignController extends AsyncNotifier<SignState> {
  late AuthRepository authFirebaseRep;
  late AuthSyncService authSyncService;

  @override
  Future<SignState> build() async {
    authFirebaseRep = ref.read(authRepoProvider);
    authSyncService = ref.read(authSyncServiceProvider);
    return const SignState(stage: SignStage.init);
  }

  Future<void> signVia(SignSource signSource) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final appUserInfo = await authFirebaseRep.signVia(signSource);
      return appUserInfo != null
          ? (appUserInfo.isNewUser ?? true)
                ? await _successSignUp()
                : await _successSignIn()
          : const SignState(stage: SignStage.init);
    });
  }

  Future<void> signUpViaEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final appUser = await authFirebaseRep.signUpWithEmailAndPassword(email: email, password: password);
      return appUser != null ? await _successSignUp() : const SignState(stage: SignStage.init);
    });
  }

  Future<void> signInViaEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final appUser = await authFirebaseRep.signInWithEmailAndPassword(email: email, password: password);
      return appUser != null ? await _successSignIn() : const SignState(stage: SignStage.init);
    });
  }

  Future<SignState> _successSignIn() async {
    await authSyncService.waitForInitialization();
    return const SignState(stage: SignStage.signInSuccess);
  }

  Future<SignState> _successSignUp() async {
    await authSyncService.waitForInitialization();
    return const SignState(stage: SignStage.signUpSuccess);
  }
}
