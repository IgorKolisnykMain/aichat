import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  String? get userUid;
  Future<String?> get token;

  //todo change UserCredential model to AppUserModel
  Future<UserCredential?> signUpWithEmailAndPassword({required String email, required String password});

  Future<UserCredential?> signInWithEmailAndPassword({required String email, required String password});
  Future<UserCredential?> signVia(SignSource signSource);

  Future<void> resetPassword({required String email});

  Future<void> logout();
  Future<void> deleteAccount();

  bool isExpiredSession();

  Future<bool> isUserExists();
  String? getEmailCurrentUser();
}
