import 'package:firebase_auth/firebase_auth.dart';
import 'package:aichat/domain/enum/firebase_sign.dart';

abstract interface class AuthFirebaseRepository {
  Future<UserCredential?> signUpWithEmailAndPassword({required String email, required String password});

  Future<UserCredential?> signInWithEmailAndPassword({required String email, required String password});
  Future<UserCredential?> signVia(FirebaseSignType signType);
  Future<UserCredential?> signInAnonymously();

  Future<String?> getFirebaseToken();

  Future<void> resetPassword({required String email});

  Future<String?> getIdToken();

  Future<void> logout();

  Future<void> deleteAccount();

  bool isExpiredSession();

  String? get userUid;

  Future<bool> isUserExists();
  String? getEmailCurrentUser();
}
