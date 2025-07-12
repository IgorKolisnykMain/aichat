import 'dart:async';

import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = AsyncNotifierProvider.autoDispose<SplashController, SplashState>(
  () => SplashController(),
);

class SplashController extends AsyncNotifier<SplashState> {
  @override
  Future<SplashState> build() async {
    state = const AsyncValue.loading();

    ref.listen(authRepoProvider, (_, initAppState) {
      initAppState.whenData((data) async {
        await Future.delayed(const Duration(seconds: 2));
        final isLoggedIn = data.currentUser != null;
        state = AsyncValue.data(
          SplashState(stage: isLoggedIn ? SplashStage.showMainScreen : SplashStage.showWelcomeScreen),
        );
      });
    });

    return const SplashState(stage: SplashStage.init);
  }
}
