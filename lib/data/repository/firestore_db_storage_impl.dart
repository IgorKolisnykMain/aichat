import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aichat/domain/repository/firestore_db_storage.dart';

const _users = 'users';

class FireStoreDbStorageImpl implements FireStoreDbStorage {
  final FirebaseFirestore fireStore;

  String? _userId;

  FireStoreDbStorageImpl({required this.fireStore});

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
