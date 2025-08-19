import 'dart:async';

import 'package:aichat/src/features/ai_chat/application/services/ai_chat_service.dart';
import 'package:aichat/src/features/ai_chat/data/providers/ai_chat_providers.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_sync_service.g.dart';

@Riverpod(keepAlive: true)
class AuthSyncService extends _$AuthSyncService {
  late final AuthRepository authRepo;
  late final AiChatService aiChatService;
  StreamSubscription? _subscription;
  Completer<void> _initializationCompleter = Completer<void>();

  @override
  AuthSyncService build() {
    authRepo = ref.read(authRepoProvider);
    aiChatService = ref.read(aiChatServiceProvider);
    ref.onDispose(() {
      onDispose();
    });
    _init();
    return this;
  }

  void _init() {
    _subscription = authRepo.authStateChanges().listen((event) {
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
    _subscription?.cancel();
  }
}
