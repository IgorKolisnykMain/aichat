import 'dart:async';

import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = AsyncNotifierProvider.autoDispose<SplashController, SplashState>(
  () => SplashController(),
);

class SplashController extends AsyncNotifier<SplashState> {
  late final AuthRepository authFirebaseRepo;

  @override
  Future<SplashState> build() async {
    state = const AsyncValue.loading();
    authFirebaseRepo = await ref.read(authRepoProvider.future);

    final isLoggedIn = authFirebaseRepo.currentUser != null;
    if (!isLoggedIn) {
      return const SplashState(stage: SplashStage.showWelcomeScreen);
    } else {
      return const SplashState(stage: SplashStage.showMainScreen);
    }
  }
}
