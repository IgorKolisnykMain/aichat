import 'package:aichat/src/features/ai_chat/domain/repository/ai_tutor_repo.dart';
import 'package:aichat/src/features/ai_chat/presentation/controller/ai_tutor_bloc.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/auth_repo.dart';
import 'package:aichat/src/features/onboarding/auth/domain/repo/user_repo.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/controller/sign_bloc.dart';
import 'package:aichat/src/features/onboarding/auth/presentation/password_recovery/controller/password_recovery_bloc.dart';
import 'package:aichat/src/features/onboarding/subscription/domain/repo/purchases_repository.dart';
import 'package:aichat/src/features/onboarding/subscription/presentation/controller/paywall_bloc.dart';
import 'package:aichat/src/features/splash/presentation/controller/splash_bloc.dart';
import 'package:aichat/src/utils/connection/domain/services/connectivity_detector_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BlocModule {
  @factoryMethod
  SignBloc signBloc(AuthRepository authRepository) => SignBloc(authRepository);

  @factoryMethod
  PasswordRecoveryBloc passwordRecoveryBloc(AuthRepository authRepository) => PasswordRecoveryBloc(authRepository);

  @factoryMethod
  SplashBloc splashBloc(AuthRepository authRepository, UserRepository userRepository, AiTutorRepo aiTutorRepo) =>
      SplashBloc(authRepository, userRepository, aiTutorRepo);

  @factoryMethod
  PaywallBloc paywallBloc(PurchasesRepository purchasesRepository, ConnectivityDetectorService connectivityService) =>
      PaywallBloc(purchasesRepository: purchasesRepository, connectivityService: connectivityService);

  @factoryMethod
  AiTutorBloc aiTutorBloc(AiTutorRepo aiTutorRepo, ConnectivityDetectorService connectivityService) =>
      AiTutorBloc(aiTutorRepo, connectivityService);
}
