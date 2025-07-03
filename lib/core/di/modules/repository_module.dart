import 'package:aichat/data/repository/ai_tutor_repo_impl.dart';
import 'package:aichat/data/repository/app_config_repository_impl.dart';
import 'package:aichat/data/repository/auth_firebase_repository_impl.dart';
import 'package:aichat/data/repository/firestore_db_storage_impl.dart';
import 'package:aichat/data/repository/purchases_repository_impl.dart';
import 'package:aichat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/domain/repository/app_config_repository.dart';
import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/domain/repository/firestore_db_storage.dart';
import 'package:aichat/domain/repository/purchases_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @singleton
  AuthFirebaseRepository authFirebaseRepository(
    FirebaseAuth firebaseAuth,
    AiTutorRepo aiRepo,
    FireStoreDbStorage fireStoreStorage,
  ) => AuthFirebaseRepositoryImpl(
    firebaseAuth: firebaseAuth,
    googleSignIn: GoogleSignIn(),
    aiRepo: aiRepo,
    fireStoreStorage: fireStoreStorage,
  );

  @singleton
  @preResolve
  Future<AppConfigRepository> appConfigRepository() async => await AppConfigRepositoryImpl.init();

  @singleton
  FireStoreDbStorage fireStoreDbStorage(FirebaseFirestore firestore) => FireStoreDbStorageImpl(fireStore: firestore);

  @singleton
  PurchasesRepository purchasesRepository(AppConfigRepository appConfigRepository) =>
      PurchasesRepositoryImpl(appConfigRepository: appConfigRepository);

  @singleton
  AiTutorRepo aiTutorRepo(AppConfigRepository appConfigRepository, FireStoreDbStorage fireStoreDbStorage) =>
      AiTutorRepoImpl(appConfigRepository, fireStoreDbStorage);
}
