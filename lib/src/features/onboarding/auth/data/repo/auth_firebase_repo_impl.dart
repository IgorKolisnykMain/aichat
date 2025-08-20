import 'dart:async';

import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/exceptions/models/common_error.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/additional_app_user_info.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/firebase_app_user.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'auth_firebase_repo_impl.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepo(Ref ref) {
  final errorLogger = ref.read(errorLoggerProvider);
  return AuthFirebaseRepositoryImpl(
    firebaseAuth: ref.read(firebaseAuthProvider),
    googleSignIn: GoogleSignIn(),
    errorLogger: errorLogger,
  );
}

class AuthFirebaseRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final ErrorLogger errorLogger;

  AuthFirebaseRepositoryImpl({required this.firebaseAuth, required this.googleSignIn, required this.errorLogger});

  @override
  Stream<AppUser?> authStateChanges() {
    return firebaseAuth.authStateChanges().map(_convertUser);
  }

  @override
  AppUser? get currentUser => _convertUser(firebaseAuth.currentUser);

  AppUser? _convertUser(User? user) {
    if (user == null) return null;
    return FirebaseAppUser(user);
  }

  @override
  Future<AppUser?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return AppUser(uid: userCredential.user!.uid, email: userCredential.user!.email);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
      if (e.message != null) {
        throw NetworkError(e.message!);
      }
    }
    return null;
  }

  @override
  Future<AppUser?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return AppUser(uid: userCredential.user!.uid, email: userCredential.user!.email);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
      if (e.message != null) {
        throw NetworkError(e.message!);
      }
    }
    return null;
  }

  Future<UserCredential> _signViaAppleId() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
    );

    final provider = OAuthProvider('apple.com');
    final userCredential = await firebaseAuth.signInWithCredential(
      provider.credential(idToken: credential.identityToken, accessToken: credential.authorizationCode),
    );
    return userCredential;
  }

  Future<UserCredential?> _signViaGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<AdditionalAppUserInfo?> signVia(SignSource signType) async {
    try {
      final userCredential = switch (signType) {
        SignSource.google => await _signViaGoogle(),
        SignSource.apple => await _signViaAppleId(),
        SignSource.anonymous => await _signInAnonymously(),
      };
      if (userCredential == null) return null;
      if (userCredential.user != null) {
        return AdditionalAppUserInfo(
          user: AppUser(uid: userCredential.user!.uid, email: userCredential.user!.email),
          isNewUser: userCredential.additionalUserInfo?.isNewUser ?? true,
        );
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'canceled') {
        return null;
      }
      debugPrint(e.toString());
      if (e.message != null) {
        throw NetworkError(e.message!);
      }
    }
    return null;
  }

  Future<UserCredential?> _signInAnonymously() async {
    try {
      final user = await firebaseAuth.signInAnonymously();
      return user;
    } on FirebaseAuthException catch (e) {
      throw NetworkError(e.message!);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw NetworkError(e.message!);
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await firebaseAuth.currentUser?.delete();
    } on FirebaseAuthException catch (_) {
      errorLogger.logError("Failed to delete account", StackTrace.current);
      await logout();
    }
  }
}
