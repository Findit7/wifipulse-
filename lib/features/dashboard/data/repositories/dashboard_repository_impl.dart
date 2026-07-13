import '../../../../shared/utils/result.dart';
import '../../../../shared/errors/failure.dart';
import '../../../../shared/network/connectivity/connectivity_service.dart';
import '../../../../shared/network/connectivity/wifi_info_service.dart';
import '../entities/dashboard_entities.dart';
import '../repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final ConnectivityService _connectivityService;
  final WifiInfoService _wifiInfoService;

  DashboardRepositoryImpl(this._connectivityService, this._wifiInfoService);

  @override
  Future<Result<DashboardStatus>> getDashboardStatus() async {
    try {
      final isOnline = await _connectivityService.hasInternetReachability();
      final ssid = await _wifiInfoService.getWifiName();
      final bssid = await _wifiInfoService.getWifiBSSID();
      final gatewayIp = await _wifiInfoService.getWifiGatewayIP();
      final localIp = await _wifiInfoService.getWifiIP();

      final networkSummary = NetworkSummary(
        ssid: ssid,
        bssid: bssid,
        gatewayIp: gatewayIp,
        localIp: localIp,
        isOnline: isOnline,
        signalStrength: 85, // Mocked for now since not supported natively cross-platform without platform channels
      );

      // Mocked statistics for Phase 2.2 until Device and Speed modules are built
      const stats = DashboardStatistics(
        connectedDevices: 12,
        downloadSpeedMbps: 150.5,
        uploadSpeedMbps: 50.2,
        pingMs: 12.0,
        healthScore: 92,
        securityScore: 100,
        aiStatus: 'Optimal',
      );

      final status = DashboardStatus(
        network: networkSummary,
        stats: stats,
        recentActivity: [
          'MacBook Pro joined the network',
          'Speed test completed: 150 Mbps',
          'AI optimized channel for less interference',
        ],
      );

      return right(status);
    } catch (e) {
      return left(NetworkFailure('Failed to fetch dashboard data: $e'));
    }
  }
}
