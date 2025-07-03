abstract interface class ConnectivityDetectorService {
  Stream<bool> get connectivityStream;

  Future<bool> isConnected();
}
