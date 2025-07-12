import 'package:cloud_firestore/cloud_firestore.dart';

const _users = 'users';

DocumentReference<Map<String, dynamic>> getUserDocRef(String? userId, FirebaseFirestore fireStore) {
  if (userId != null) {
    return fireStore.collection(_users).doc(userId);
  } else {
    throw Exception("Fail get user. User unauthorized");
  }
}
