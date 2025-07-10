import 'dart:async';

import 'package:aichat/src/features/ai_chat/data/repository/ai_tutor_repo_impl.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/user_firestore_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/enums/sign_source.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:aichat/src/utils/error/domain/enums/local_error.dart';
import 'package:aichat/src/utils/error/domain/models/local_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authFirebaseRepoProvider = FutureProvider<AuthRepository>((ref) async {
  final aiRepo = await ref.read(aiTutorRepoProvider.future);
  return AuthFirebaseRepositoryImpl(
    firebaseAuth: ref.read(firebaseAuthProvider),
    googleSignIn: GoogleSignIn(),
    aiRepo: aiRepo,
    userRepository: ref.read(userFirestoreRepoProvider),
  );
});

class AuthFirebaseRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final AiTutorRepo aiRepo;

  final UserRepository userRepository;

  AuthFirebaseRepositoryImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.aiRepo,
    required this.userRepository,
  });

  void _initAfterSign(String uid) {
    userRepository.userId = uid;
    aiRepo.setupAiChat();
  }

  @override
  Future<String?> get token async => firebaseAuth.currentUser?.getIdToken();

  @override
  String? get userUid => firebaseAuth.currentUser?.uid;

  @override
  Future<UserCredential?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;
        _initAfterSign(uid);
        return userCredential;
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
        throw NetworkException(e.message!);
      }
    } catch (e) {
      throw LocalException(LocalError.defaultError);
    }
    return null;
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;
        _initAfterSign(uid);
        return userCredential;
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
        throw NetworkException(e.message!);
      }
    } catch (e) {
      throw LocalException(LocalError.defaultError);
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

  Future<UserCredential?> _signViaGoogleAndroid() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential?> signVia(SignSource signType) async {
    try {
      final userCredential = switch (signType) {
        SignSource.google => await _signViaGoogleAndroid(),
        SignSource.apple => await _signViaAppleId(),
        SignSource.anonymous => await _signInAnonymously(),
      };
      if (userCredential == null) return null;
      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;
        _initAfterSign(uid);
        return userCredential;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'canceled') {
        return null;
      }
      debugPrint(e.toString());
      if (e.message != null) {
        throw NetworkException(e.message!);
      }
    } catch (e, trace) {
      FirebaseCrashlytics.instance.recordError(e, trace);
      throw LocalException(LocalError.defaultError);
    }
    return null;
  }

  Future<UserCredential?> _signInAnonymously() async {
    try {
      final user = await firebaseAuth.signInAnonymously();
      return user;
    } on FirebaseAuthException catch (e) {
      throw NetworkException(e.message!);
    } catch (e) {
      throw LocalException(LocalError.defaultError);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw NetworkException(e.message!);
    } catch (e) {
      throw LocalException(LocalError.defaultError);
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
      await logout();
    }
  }

  @override
  bool isExpiredSession() {
    return firebaseAuth.currentUser == null;
  }

  @override
  Future<bool> isUserExists() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) return false;
      await currentUser.reload();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false;
      }
      return false;
    }
  }

  @override
  String? getEmailCurrentUser() {
    return firebaseAuth.currentUser?.email;
  }
}
