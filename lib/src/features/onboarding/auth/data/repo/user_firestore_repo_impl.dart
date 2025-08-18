import 'dart:async';

import 'package:aichat/src/core/di/modules/firebase_module.dart' show firestoreProvider;
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart' show AppUser;
import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_firestore_repo_impl.g.dart';

const _users = 'users';

@Riverpod(keepAlive: true)
UserRepository userFirestoreRepo(Ref ref) {
  final authRepo = ref.read(authRepoProvider);
  final userRepo = UserFirestoreRepoImpl(
    fireStore: ref.read(firestoreProvider),
    userStream: authRepo.authStateChanges(),
  );
  ref.onDispose(userRepo.dispose);
  return userRepo;
}

class UserFirestoreRepoImpl implements UserRepository {
  final FirebaseFirestore fireStore;
  late StreamSubscription<AppUser?> _userStream;

  String? _userId;

  UserFirestoreRepoImpl({required this.fireStore, required Stream<AppUser?> userStream}) {
    _userStream = userStream.listen((user) {
      _userId = user?.uid;
    });
  }

  void dispose() {
    _userStream.cancel();
  }

  DocumentReference<Map<String, dynamic>> get _userRef => fireStore.doc('$_users/$_userId');

  @override
  String? get userId => _userId;

  @override
  Future<void> loadData() async {
    // TODO: Implement data loading
  }

  @override
  Future<void> cleanData() async {
    _userId = null;
  }

  @override
  Future<void> deleteAccount() async {
    await _userRef.delete();
  }
}
