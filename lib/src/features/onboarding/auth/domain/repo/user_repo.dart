import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class UserRepository {
  DocumentReference<Map<String, dynamic>> get userDocRef;

  String? get userId;

  set userId(String? value);

  Future<void> loadData();

  Future<void> cleanData();
  Future<void> deleteAccount();
}
