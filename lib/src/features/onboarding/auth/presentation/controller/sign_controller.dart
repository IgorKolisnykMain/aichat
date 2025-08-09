import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_sync_service.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final signControllerProvider = StateNotifierProvider.autoDispose<SignController, AsyncValue<SignState>>((ref) {
  final authFirebaseRep = ref.read(authRepoProvider);
  final authSyncService = ref.read(authSyncServiceProvider);
  return SignController(authFirebaseRep, authSyncService);
});

class SignController extends StateNotifier<AsyncValue<SignState>> {
  final AuthRepository authFirebaseRep;
  final AuthSyncService authSyncService;

  SignController(this.authFirebaseRep, this.authSyncService) : super(const AsyncValue.data(SignState(stage: SignStage.init)));

  Future<void> signVia(SignSource signSource) async {
    state = const AsyncValue.loading();
    try {
      final appUserInfo = await authFirebaseRep.signVia(signSource);
      if (appUserInfo != null) {
        (appUserInfo.isNewUser ?? true) ? await _successSignUp() : await _successSignIn();
      } else {
        state = const AsyncValue.data(SignState(stage: SignStage.init));
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> signUpViaEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      final appUser = await authFirebaseRep.signUpWithEmailAndPassword(email: email, password: password);
      if (appUser != null) {
        await _successSignUp();
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> signInViaEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      final appUser = await authFirebaseRep.signInWithEmailAndPassword(email: email, password: password);
      if (appUser != null) {
        await _successSignIn();
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> _successSignIn() async {
    await authSyncService.waitForInitialization();
    state = const AsyncValue.data(SignState(stage: SignStage.signInSuccess));
  }

  Future<void> _successSignUp() async {
    await authSyncService.waitForInitialization();
    state = const AsyncValue.data(SignState(stage: SignStage.signUpSuccess));
  }
}
