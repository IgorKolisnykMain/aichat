import 'dart:async';

import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const _users = 'users';

class UserFirestoreRepoImpl implements UserRepository {
  final FirebaseFirestore fireStore;

  String? _userId;

  UserFirestoreRepoImpl({required this.fireStore});

  @override
  DocumentReference<Map<String, dynamic>> get userDocRef {
    if (userId != null) {
      return fireStore.collection(_users).doc(userId);
    } else {
      throw Exception("Fail get user progress. Anonymous user unauthorized");
    }
  }

  @override
  String? get userId => _userId;

  @override
  set userId(String? value) {
    _userId = value;
  }

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
    await userDocRef.delete();
  }
}
