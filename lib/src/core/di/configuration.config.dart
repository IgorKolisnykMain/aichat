// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/onboarding/subscription/domain/repo/purchases_repository.dart'
    as _i308;
import '../../utils/connection/domain/services/connectivity_detector_service.dart'
    as _i754;
import '../config/domain/repository/app_config_repository.dart' as _i741;
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
  final serviceModule = _$ServiceModule();
  await gh.singletonAsync<_i741.AppConfigRepository>(
    () => repositoryModule.appConfigRepository(),
    preResolve: true,
  );
  gh.singleton<_i754.ConnectivityDetectorService>(
    () => serviceModule.connectivityDetectorService(),
  );
  gh.singleton<_i308.PurchasesRepository>(
    () => repositoryModule.purchasesRepository(gh<_i741.AppConfigRepository>()),
  );
  return getIt;
}

class _$RepositoryModule extends _i554.RepositoryModule {}

class _$ServiceModule extends _i681.ServiceModule {}
