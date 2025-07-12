import 'dart:async';

import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier(this.ref) {
    _init();
  }

  final Ref ref;
  StreamSubscription<dynamic>? _subscription;

  void _init() {
    ref.onDispose(() {
      _subscription?.cancel();
    });
    ref.listen(authRepoProvider, (previous, next) {
      next.when(
        data: (authRepo) {
          _subscription?.cancel();
          _subscription = authRepo.authStateChanges().listen((_) {
            notifyListeners();
          });
        },
        error: (_, _) {},
        loading: () {},
      );
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
