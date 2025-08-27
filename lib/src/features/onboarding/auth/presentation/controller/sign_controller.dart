import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_sync_service.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_controller.g.dart';

@riverpod
class SignController extends _$SignController {
  late AuthRepository _authFirebaseRep;
  late AuthSyncService _authSyncService;

  @override
  Future<SignState> build() async {
    _authFirebaseRep = ref.read(authRepoProvider);
    _authSyncService = ref.read(authSyncServiceProvider);
    return const SignState(stage: SignStage.init);
  }

  Future<void> signVia(SignSource signSource) async {
    state = const AsyncValue.loading();
    final newState = await AsyncValue.guard(() async {
      final appUserInfo = await _authFirebaseRep.signVia(signSource);
      return appUserInfo != null
          ? (appUserInfo.isNewUser ?? true)
                ? await _successSignUp()
                : await _successSignIn()
          : const SignState(stage: SignStage.init);
    });
    if (ref.mounted) {
      state = newState;
    }
  }

  Future<void> signUpViaEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    final newState = await AsyncValue.guard(() async {
      final appUser = await _authFirebaseRep.signUpWithEmailAndPassword(email: email, password: password);
      return appUser != null ? await _successSignUp() : const SignState(stage: SignStage.init);
    });
    if (ref.mounted) {
      state = newState;
    }
  }

  Future<void> signInViaEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    final newState = await AsyncValue.guard(() async {
      final appUser = await _authFirebaseRep.signInWithEmailAndPassword(email: email, password: password);
      return appUser != null ? await _successSignIn() : const SignState(stage: SignStage.init);
    });
    if (ref.mounted) {
      state = newState;
    }
  }

  Future<SignState> _successSignIn() async {
    await _authSyncService.waitForInitialization();
    return const SignState(stage: SignStage.signInSuccess);
  }

  Future<SignState> _successSignUp() async {
    await _authSyncService.waitForInitialization();
    return const SignState(stage: SignStage.signUpSuccess);
  }
}
