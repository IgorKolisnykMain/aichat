import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/features/ai_chat/data/repository/ai_tutor_repo_impl.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/auth_firebase_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/data/repo/user_firestore_repo_impl.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/repo/purchases_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @singleton
  AuthRepository authFirebaseRepository(FirebaseAuth firebaseAuth, AiTutorRepo aiRepo, UserRepository userRepository) =>
      AuthFirebaseRepositoryImpl(
        firebaseAuth: firebaseAuth,
        googleSignIn: GoogleSignIn(),
        aiRepo: aiRepo,
        userRepository: userRepository,
      );

  @singleton
  @preResolve
  Future<AppConfigRepository> appConfigRepository() async => await AppConfigRepositoryImpl.init();

  @singleton
  UserRepository userFirestoreRepository(FirebaseFirestore firestore) => UserFirestoreRepoImpl(fireStore: firestore);

  @singleton
  PurchasesRepository purchasesRepository(AppConfigRepository appConfigRepository) =>
      PurchasesRepositoryImpl(appConfigRepository: appConfigRepository);

  @singleton
  AiTutorRepo aiTutorRepo(AppConfigRepository appConfigRepository, UserRepository userRepository) =>
      AiTutorRepoImpl(appConfigRepository, userRepository);
}
