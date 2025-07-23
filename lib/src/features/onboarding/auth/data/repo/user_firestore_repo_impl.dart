import 'dart:async';

import 'package:aichat/src/core/di/modules/firebase_module.dart' show firestoreProvider;
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart' show AppUser;
import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:aichat/src/utils/firestore/user/firestore_user_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userFirestoreRepoProvider = FutureProvider.autoDispose<UserRepository>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  final userRepo = UserFirestoreRepoImpl(
    fireStore: await ref.read(firestoreProvider.future),
    userStream: authRepo.authStateChanges(),
  );
  ref.onDispose(userRepo.dispose);
  return userRepo;
});

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

  DocumentReference<Map<String, dynamic>> get _userDocRef => getUserDocRef(_userId, fireStore);

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
    await _userDocRef.delete();
  }
}
