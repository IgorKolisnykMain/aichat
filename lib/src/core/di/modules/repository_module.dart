import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/core/config/domain/repository/app_config_repository.dart';
import 'package:aichat/src/features/onboarding/subscription/data/repo/purchases_repository_impl.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/repo/purchases_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  // @singleton
  // AuthRepository authFirebaseRepository(FirebaseAuth firebaseAuth, AiTutorRepo aiRepo, UserRepository userRepository) =>
  //     AuthFirebaseRepositoryImpl(
  //       firebaseAuth: firebaseAuth,
  //       googleSignIn: GoogleSignIn(),
  //       aiRepo: aiRepo,
  //       userRepository: userRepository,
  //     );

  @singleton
  @preResolve
  Future<AppConfigRepository> appConfigRepository() async => await AppConfigRepositoryImpl.init();

  // @singleton
  // UserRepository userFirestoreRepository(FirebaseFirestore firestore) => UserFirestoreRepoImpl(fireStore: firestore);

  @singleton
  PurchasesRepository purchasesRepository(AppConfigRepository appConfigRepository) =>
      PurchasesRepositoryImpl(appConfigRepository: appConfigRepository);

  // @singleton
  // AiTutorRepo aiTutorRepo(AppConfigRepository appConfigRepository, UserRepository userRepository) =>
  //     AiTutorRepoImpl(appConfigRepository: appConfigRepository, userRepository: userRepository);
}
