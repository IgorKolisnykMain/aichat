import 'package:aichat/data/services/connectivity_detector_service_impl.dart';
import 'package:aichat/domain/services/connectivity_detector_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServiceModule {
  @singleton
  ConnectivityDetectorService connectivityDetectorService() =>
      ConnectivityDetectorServiceImpl(connectivity: Connectivity());
}
