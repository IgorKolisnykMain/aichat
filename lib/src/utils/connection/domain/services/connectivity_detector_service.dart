abstract interface class ConnectivityDetectorService {
  Stream<bool> get watchConnectivity;

  Future<bool> isConnected();
}
