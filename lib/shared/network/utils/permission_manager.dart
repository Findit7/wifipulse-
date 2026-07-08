import 'package:permission_handler/permission_handler.dart';
import '../../services/logger_service.dart';

/// Centralized manager for handling Android permissions required for networking.
class PermissionManager {
  final LoggerService _logger;

  PermissionManager(this._logger);

  /// Requests location permissions, which are required for accessing WiFi SSID on Android.
  Future<bool> requestLocationPermission() async {
    _logger.info('Requesting location permission...');
    final status = await Permission.locationWhenInUse.request();
    final isGranted = status.isGranted;
    if (isGranted) {
      _logger.info('Location permission granted.');
    } else {
      _logger.warning('Location permission denied: $status');
    }
    return isGranted;
  }

  /// Requests nearby devices permission, required on Android 13+ for certain network operations.
  Future<bool> requestNearbyWifiPermission() async {
    _logger.info('Requesting nearby wifi devices permission...');
    final status = await Permission.nearbyWifiDevices.request();
    final isGranted = status.isGranted;
    if (isGranted) {
      _logger.info('Nearby wifi permission granted.');
    } else {
      _logger.warning('Nearby wifi permission denied: $status');
    }
    return isGranted;
  }

  /// Checks if all necessary network permissions are granted.
  Future<bool> hasNetworkPermissions() async {
    final locationGranted = await Permission.locationWhenInUse.isGranted;
    final nearbyGranted = await Permission.nearbyWifiDevices.isGranted;
    return locationGranted && nearbyGranted;
  }
}
