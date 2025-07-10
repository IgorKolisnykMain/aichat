import 'dart:async';

import 'package:aichat/src/features/ai_chat/data/repository/ai_tutor_repo_impl.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/user_firestore_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = AsyncNotifierProvider.autoDispose<SplashController, SplashState>(
  () => SplashController(),
);

class SplashController extends AsyncNotifier<SplashState> {
  late final AuthRepository authFirebaseRepo;
  late final UserRepository userRepository;
  late final AiTutorRepo aiTutorRepo;

  @override
  Future<SplashState> build() async {
    authFirebaseRepo = await ref.read(authFirebaseRepoProvider.future);
    userRepository = ref.read(userFirestoreRepoProvider);
    aiTutorRepo = await ref.read(aiTutorRepoProvider.future);

    return const SplashState(stage: SplashStage.init);
  }

  Future<void> delaySplashTime() async {
    state = const AsyncValue.loading();
    final isLoggedIn = !authFirebaseRepo.isExpiredSession() && await authFirebaseRepo.isUserExists();
    if (!isLoggedIn) {
      await Future.delayed(const Duration(seconds: 1));
      state = const AsyncValue.data(SplashState(stage: SplashStage.showWelcomeScreen));
    } else {
      userRepository.userId = authFirebaseRepo.userUid;
      await aiTutorRepo.setupAiChat();
      state = const AsyncValue.data(SplashState(stage: SplashStage.showMainScreen));
    }
  }
}
