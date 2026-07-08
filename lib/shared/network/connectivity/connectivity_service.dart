import 'package:connectivity_plus/connectivity_plus.dart';
import '../../services/logger_service.dart';

/// Service to monitor network connectivity status.
class ConnectivityService {
  final Connectivity _connectivity;
  final LoggerService _logger;

  ConnectivityService(this._connectivity, this._logger);

  /// Gets the current connectivity status.
  Future<List<ConnectivityResult>> checkConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _logger.networkLog('Current connectivity: $results');
      return results;
    } catch (e) {
      _logger.error('Failed to check connectivity', e);
      return [ConnectivityResult.none];
    }
  }

  /// Returns a stream of connectivity changes.
  Stream<List<ConnectivityResult>> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map((results) {
      _logger.networkLog('Connectivity changed: $results');
      return results;
    });
  }

  /// Helper to check if currently connected to WiFi.
  Future<bool> isConnectedToWifi() async {
    final results = await checkConnectivity();
    return results.contains(ConnectivityResult.wifi);
  }

  /// Helper to check if currently offline.
  Future<bool> isOffline() async {
    final results = await checkConnectivity();
    return results.contains(ConnectivityResult.none) || results.isEmpty;
  }
}
