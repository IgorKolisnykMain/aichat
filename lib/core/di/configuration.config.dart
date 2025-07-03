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

import '../../domain/repository/ai_tutor_repo.dart' as _i738;
import '../../domain/repository/app_config_repository.dart' as _i403;
import '../../domain/repository/auth_firebase_repository.dart' as _i100;
import '../../domain/repository/firestore_db_storage.dart' as _i555;
import '../../domain/repository/purchases_repository.dart' as _i631;
import '../../domain/services/connectivity_detector_service.dart' as _i444;
import '../../presentation/features/ai_chat/bloc/ai_tutor_bloc.dart' as _i736;
import '../../presentation/features/sign/bloc/sign_bloc.dart' as _i965;
import '../../presentation/features/sign/password_recovery/bloc/password_recovery_bloc.dart'
    as _i231;
import '../../presentation/features/splash/bloc/splash_bloc.dart' as _i113;
import '../../presentation/features/subscription/bloc/paywall_bloc.dart'
    as _i468;
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
  await gh.singletonAsync<_i403.AppConfigRepository>(
    () => repositoryModule.appConfigRepository(),
    preResolve: true,
  );
  await gh.singletonAsync<_i982.FirebaseApp>(
    () => firebaseModule.firebaseApp(),
    preResolve: true,
  );
  gh.singleton<_i444.ConnectivityDetectorService>(
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
  gh.singleton<_i631.PurchasesRepository>(
    () => repositoryModule.purchasesRepository(gh<_i403.AppConfigRepository>()),
  );
  gh.singleton<_i555.FireStoreDbStorage>(
    () => repositoryModule.fireStoreDbStorage(gh<_i974.FirebaseFirestore>()),
  );
  gh.singleton<_i738.AiTutorRepo>(
    () => repositoryModule.aiTutorRepo(
      gh<_i403.AppConfigRepository>(),
      gh<_i555.FireStoreDbStorage>(),
    ),
  );
  gh.factory<_i468.PaywallBloc>(
    () => blocModule.paywallBloc(
      gh<_i631.PurchasesRepository>(),
      gh<_i444.ConnectivityDetectorService>(),
    ),
  );
  gh.singleton<_i100.AuthFirebaseRepository>(
    () => repositoryModule.authFirebaseRepository(
      gh<_i59.FirebaseAuth>(),
      gh<_i738.AiTutorRepo>(),
      gh<_i555.FireStoreDbStorage>(),
    ),
  );
  gh.factory<_i736.AiTutorBloc>(
    () => blocModule.aiTutorBloc(
      gh<_i738.AiTutorRepo>(),
      gh<_i444.ConnectivityDetectorService>(),
    ),
  );
  gh.factory<_i113.SplashBloc>(
    () => blocModule.splashBloc(
      gh<_i100.AuthFirebaseRepository>(),
      gh<_i555.FireStoreDbStorage>(),
      gh<_i738.AiTutorRepo>(),
    ),
  );
  gh.factory<_i965.SignBloc>(
    () => blocModule.signBloc(gh<_i100.AuthFirebaseRepository>()),
  );
  gh.factory<_i231.PasswordRecoveryBloc>(
    () => blocModule.passwordRecoveryBloc(gh<_i100.AuthFirebaseRepository>()),
  );
  return getIt;
}

class _$RepositoryModule extends _i554.RepositoryModule {}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$ServiceModule extends _i681.ServiceModule {}

class _$BlocModule extends _i539.BlocModule {}
