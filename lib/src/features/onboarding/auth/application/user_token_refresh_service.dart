import 'dart:async';

import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/user_metadata_repository.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_token_refresh_service.g.dart';

/// Class used to force an ID token refresh on sign in
@Riverpod(keepAlive: true)
class UserTokenRefreshService extends _$UserTokenRefreshService {
  late final AuthRepository authRepo;

  StreamSubscription<AppUser?>? _userSubscription;
  StreamSubscription<DateTime?>? _userMetadataSubscription;

  @override
  UserTokenRefreshService build() {
    authRepo = ref.read(authRepoProvider);
    ref.onDispose(() {
      dispose();
    });
    _init();
    return this;
  }

  void _init() {
    _userSubscription = authRepo.authStateChanges().listen((event) {
      final user = event;
      // * if a previous subscription was active, dispose it
      _userMetadataSubscription?.cancel();
      if (user != null) {
        // * on sign-in, listen to user metadata updates
        // * (and register a subscription)
        _userMetadataSubscription = ref.read(userMetadataRepositoryProvider).watchUserMetadata(user.uid).listen((
          refreshTime,
        ) async {
          // * read user again as it may be null by the time we reach this callback
          final user = authRepo.currentUser;
          if (refreshTime != null && user != null) {
            debugPrint('Force refresh token: $refreshTime, uid:${user.uid}');
            // * force an ID token refresh, which will cause a new stream event
            // * to be emitted by [idTokenChanges]
            await user.forceRefreshIdToken();
          }
        });
      }
    });
  }

  // cleanup
  void dispose() {
    _userSubscription?.cancel();
    _userMetadataSubscription?.cancel();
  }
}
