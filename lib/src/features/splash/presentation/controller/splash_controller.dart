import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = AsyncNotifierProvider.autoDispose<SplashController, SplashState>(
  SplashController.new,
);

class SplashController extends AsyncNotifier<SplashState> {
  @override
  Future<SplashState> build() async {
    ref.listen(authRepoProvider, (previous, next) async {
      await Future.delayed(const Duration(seconds: 2));
      final isLoggedIn = next.currentUser != null;
      state = AsyncValue.data(
        SplashState(stage: isLoggedIn ? SplashStage.showMainScreen : SplashStage.showWelcomeScreen),
      );
    });

    final isLoggedIn = ref.read(authRepoProvider).currentUser != null;
    return SplashState(stage: isLoggedIn ? SplashStage.showMainScreen : SplashStage.showWelcomeScreen);
  }
}
