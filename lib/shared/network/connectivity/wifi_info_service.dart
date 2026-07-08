import 'package:network_info_plus/network_info_plus.dart';
import '../../services/logger_service.dart';
import '../models/wifi_info.dart';
import '../../errors/failure.dart';
import '../../utils/result.dart';
import 'package:fpdart/fpdart.dart';

/// Service to gather detailed WiFi connection information.
class WifiInfoService {
  final NetworkInfo _networkInfo;
  final LoggerService _logger;

  WifiInfoService(this._networkInfo, this._logger);

  /// Retrieves detailed information about the current WiFi connection.
  Future<Result<WifiInfo>> getCurrentWifiInfo() async {
    try {
      final ssid = await _networkInfo.getWifiName();
      final bssid = await _networkInfo.getWifiBSSID();
      final gatewayIp = await _networkInfo.getWifiGatewayIP();
      final localIp = await _networkInfo.getWifiIP();

      // Note: signal strength is not natively supported by network_info_plus without custom platform channels.
      // Connection type is assumed WiFi if this service is used successfully.

      final info = WifiInfo(
        ssid: ssid,
        bssid: bssid,
        gatewayIp: gatewayIp,
        localIp: localIp,
        connectionType: 'WiFi',
      );

      _logger.networkLog('Gathered WiFi Info: $info');
      return Right(info);
    } catch (e, stackTrace) {
      _logger.error('Failed to get WiFi info', e, stackTrace);
      return Left(NetworkFailure('Failed to retrieve WiFi information: $e'));
    }
  }
}
