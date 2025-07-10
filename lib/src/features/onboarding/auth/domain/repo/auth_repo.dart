import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart' show AppUser;
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;

  //todo change UserCredential model to AppUserModel
  Future<UserCredential?> signUpWithEmailAndPassword({required String email, required String password});

  Future<UserCredential?> signInWithEmailAndPassword({required String email, required String password});
  Future<UserCredential?> signVia(SignSource signSource);

  Future<void> resetPassword({required String email});

  Future<void> logout();
  Future<void> deleteAccount();
}
