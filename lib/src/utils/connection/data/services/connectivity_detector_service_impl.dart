import 'package:aichat/src/utils/connection/domain/services/connectivity_detector_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityDetectorServiceProvider = Provider<ConnectivityDetectorService>((ref) {
  return ConnectivityDetectorServiceImpl(connectivity: Connectivity());
});

class ConnectivityDetectorServiceImpl implements ConnectivityDetectorService {
  final Connectivity connectivity;

  ConnectivityDetectorServiceImpl({required this.connectivity});

  /// Stream of [bool] values representing the current connectivity state. The first value is skipped to notify only about subsequent changes.
  @override
  Stream<bool> get connectivityStream => connectivity.onConnectivityChanged.map(_connectivityResultToBool).skip(1);

  @override
  Future<bool> isConnected() async {
    final res = await connectivity.checkConnectivity();
    return _connectivityResultToBool(res);
  }

  bool _connectivityResultToBool(List<ConnectivityResult> result) {
    return switch (result.first) {
      ConnectivityResult.wifi => true,
      ConnectivityResult.mobile => true,
      ConnectivityResult.vpn => true,
      ConnectivityResult.ethernet => true,
      ConnectivityResult.none => false,
      _ => false,
    };
  }
}
