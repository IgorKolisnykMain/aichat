import 'package:aichat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/domain/repository/auth_firebase_repository.dart';
import 'package:aichat/domain/repository/firestore_db_storage.dart';
import 'package:aichat/domain/repository/purchases_repository.dart';
import 'package:aichat/domain/services/connectivity_detector_service.dart';
import 'package:aichat/presentation/features/ai_chat/bloc/ai_tutor_bloc.dart';
import 'package:aichat/presentation/features/sign/bloc/sign_bloc.dart';
import 'package:aichat/presentation/features/sign/password_recovery/bloc/password_recovery_bloc.dart';
import 'package:aichat/presentation/features/splash/bloc/splash_bloc.dart';
import 'package:aichat/presentation/features/subscription/bloc/paywall_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BlocModule {
  @factoryMethod
  SignBloc signBloc(AuthFirebaseRepository authRepository) => SignBloc(authRepository);

  @factoryMethod
  PasswordRecoveryBloc passwordRecoveryBloc(AuthFirebaseRepository authRepository) =>
      PasswordRecoveryBloc(authRepository);

  @factoryMethod
  SplashBloc splashBloc(
    AuthFirebaseRepository authRepository,
    FireStoreDbStorage fireStoreDbRepository,
    AiTutorRepo aiTutorRepo,
  ) => SplashBloc(authRepository, fireStoreDbRepository, aiTutorRepo);

  @factoryMethod
  PaywallBloc paywallBloc(PurchasesRepository purchasesRepository, ConnectivityDetectorService connectivityService) =>
      PaywallBloc(purchasesRepository: purchasesRepository, connectivityService: connectivityService);

  @factoryMethod
  AiTutorBloc aiTutorBloc(AiTutorRepo aiTutorRepo, ConnectivityDetectorService connectivityService) =>
      AiTutorBloc(aiTutorRepo, connectivityService);
}
