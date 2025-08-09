import 'dart:async';

import 'package:aichat/src/features/ai_chat/data/providers/ai_chat_providers.dart';
import 'package:aichat/src/features/ai_chat/domain/services/ai_chat_service.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSyncServiceProvider = Provider<AuthSyncService>((ref) {
  final authRepo = ref.read(authRepoProvider);
  final aiChatService = ref.read(aiChatServiceProvider);
  final authSyncService = AuthSyncService(authRepo, aiChatService);
  ref.onDispose(() {
    authSyncService.onDispose();
  });
  return authSyncService;
});

class AuthSyncService {
  final AuthRepository authRepo;
  final AiChatService aiChatService;
  StreamSubscription? subscription;
  Completer<void> _initializationCompleter = Completer<void>();

  AuthSyncService(this.authRepo, this.aiChatService) {
    _init();
  }

  void _init() {
    subscription = authRepo.authStateChanges().listen((event) {
      final user = event;
      if (user != null) {
        if (!_initializationCompleter.isCompleted) {
          aiChatService.initialize();
          _initializationCompleter.complete();
        } else {
          _initializationCompleter = Completer<void>();
        }
      }
    });
    //! ref.listen is a better solution, but it doesn't work.
    // subscription = ref.listen<AsyncValue<AppUser?>>(
    //   authStateChangesProvider,
    //   (previous, next) async {
    //     final previousUser = previous?.value;
    //     final user = next.value;
    //     if (previousUser == null && user != null) {
    //       try {
    //         await ref.read(aiChatServiceProvider).initialize();
    //         if (!_initializationCompleter.isCompleted) {
    //           _initializationCompleter.complete();
    //         }
    //       } catch (e) {
    //         if (!_initializationCompleter.isCompleted) {
    //           _initializationCompleter.completeError(e);
    //         }
    //       }
    //     }
    //   },
    // );
  }

  //* Waiting for all services to finish initializing
  Future<void> waitForInitialization() => _initializationCompleter.future;

  void onDispose() {
    subscription?.cancel();
  }
}
