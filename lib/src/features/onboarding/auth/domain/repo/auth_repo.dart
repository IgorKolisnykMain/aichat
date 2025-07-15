import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/additional_app_user_info.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart' show AppUser;

abstract interface class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;

  Future<AppUser?> signUpWithEmailAndPassword({required String email, required String password});

  Future<AppUser?> signInWithEmailAndPassword({required String email, required String password});
  Future<AdditionalAppUserInfo?> signVia(SignSource signSource);

  Future<void> resetPassword({required String email});

  Future<void> logout();
  Future<void> deleteAccount();
}
