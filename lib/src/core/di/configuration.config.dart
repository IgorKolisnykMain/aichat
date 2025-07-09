// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/ai_chat/domain/repository/ai_tutor_repo.dart' as _i354;
import '../../features/ai_chat/presentation/controller/ai_tutor_bloc.dart'
    as _i1041;
import '../../features/onboarding/auth/domain/repo/auth_repo.dart' as _i1053;
import '../../features/onboarding/auth/domain/repo/user_repo.dart' as _i25;
import '../../features/onboarding/auth/presentation/controller/sign_bloc.dart'
    as _i298;
import '../../features/onboarding/auth/presentation/password_recovery/controller/password_recovery_bloc.dart'
    as _i741;
import '../../features/onboarding/subscription/domain/repo/purchases_repository.dart'
    as _i308;
import '../../features/onboarding/subscription/presentation/controller/paywall_bloc.dart'
    as _i670;
import '../../features/splash/presentation/controller/splash_bloc.dart'
    as _i571;
import '../../utils/connection/domain/services/connectivity_detector_service.dart'
    as _i754;
import '../config/domain/repository/app_config_repository.dart' as _i741;
import 'modules/bloc_module.dart' as _i539;
import 'modules/firebase_module.dart' as _i398;
import 'modules/repository_module.dart' as _i554;
import 'modules/service_module.dart' as _i681;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $configureDependencies(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final repositoryModule = _$RepositoryModule();
  final firebaseModule = _$FirebaseModule();
  final serviceModule = _$ServiceModule();
  final blocModule = _$BlocModule();
  await gh.singletonAsync<_i741.AppConfigRepository>(
    () => repositoryModule.appConfigRepository(),
    preResolve: true,
  );
  await gh.singletonAsync<_i982.FirebaseApp>(
    () => firebaseModule.firebaseApp(),
    preResolve: true,
  );
  gh.singleton<_i754.ConnectivityDetectorService>(
    () => serviceModule.connectivityDetectorService(),
  );
  gh.singleton<_i59.FirebaseAuth>(
    () => firebaseModule.firebaseAuth(gh<_i982.FirebaseApp>()),
  );
  gh.singleton<_i974.FirebaseFirestore>(
    () => firebaseModule.firebaseFireStore(gh<_i982.FirebaseApp>()),
  );
  gh.singleton<_i457.FirebaseStorage>(
    () => firebaseModule.firebaseStorage(gh<_i982.FirebaseApp>()),
  );
  gh.singleton<_i308.PurchasesRepository>(
    () => repositoryModule.purchasesRepository(gh<_i741.AppConfigRepository>()),
  );
  gh.singleton<_i25.UserRepository>(
    () =>
        repositoryModule.userFirestoreRepository(gh<_i974.FirebaseFirestore>()),
  );
  gh.factory<_i670.PaywallBloc>(
    () => blocModule.paywallBloc(
      gh<_i308.PurchasesRepository>(),
      gh<_i754.ConnectivityDetectorService>(),
    ),
  );
  gh.singleton<_i354.AiTutorRepo>(
    () => repositoryModule.aiTutorRepo(
      gh<_i741.AppConfigRepository>(),
      gh<_i25.UserRepository>(),
    ),
  );
  gh.factory<_i1041.AiTutorBloc>(
    () => blocModule.aiTutorBloc(
      gh<_i354.AiTutorRepo>(),
      gh<_i754.ConnectivityDetectorService>(),
    ),
  );
  gh.singleton<_i1053.AuthRepository>(
    () => repositoryModule.authFirebaseRepository(
      gh<_i59.FirebaseAuth>(),
      gh<_i354.AiTutorRepo>(),
      gh<_i25.UserRepository>(),
    ),
  );
  gh.factory<_i298.SignBloc>(
    () => blocModule.signBloc(gh<_i1053.AuthRepository>()),
  );
  gh.factory<_i741.PasswordRecoveryBloc>(
    () => blocModule.passwordRecoveryBloc(gh<_i1053.AuthRepository>()),
  );
  gh.factory<_i571.SplashBloc>(
    () => blocModule.splashBloc(
      gh<_i1053.AuthRepository>(),
      gh<_i25.UserRepository>(),
      gh<_i354.AiTutorRepo>(),
    ),
  );
  return getIt;
}

class _$RepositoryModule extends _i554.RepositoryModule {}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$ServiceModule extends _i681.ServiceModule {}

class _$BlocModule extends _i539.BlocModule {}
