abstract class IConnectivityService {
  /// Emits true if connected to WiFi or Mobile Data
  Stream<bool> get isConnectedStream;

  /// Returns true if currently connected to WiFi or Mobile Data
  Future<bool> checkConnectivity();

  /// Returns true specifically if connected to a WiFi network
  Future<bool> isWifiConnected();

  /// Returns true specifically if connected to Mobile Data
  Future<bool> isMobileDataConnected();

  /// Returns true if the device can actually reach the internet (not just connected to a router)
  Future<bool> hasInternetReachability();

  /// Returns true if background sync is permitted (e.g. not offline, not metered if required)
  Future<bool> isSyncAvailable();
}
