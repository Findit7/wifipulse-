import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../../networks/domain/repositories/network_repository.dart';
import '../../../devices/domain/repositories/device_repository.dart';
import '../../../usage/domain/repositories/usage_repository.dart';
import '../../../../core/network/connectivity_service.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final NetworkRepository _networkRepository;
  final DeviceRepository _deviceRepository;
  final UsageRepository _usageRepository;
  final IConnectivityService _connectivityService;

  DashboardRepositoryImpl(
    this._networkRepository,
    this._deviceRepository,
    this._usageRepository,
    this._connectivityService,
  );

  @override
  Future<Either<AppException, DashboardSummaryEntity>> getSummary(String userId) async {
    return ErrorHandler.execute(() async {
      final networksResult = await _networkRepository.getNetworksForUser(userId);
      
      return networksResult.fold(
        (l) => throw l,
        (networks) async {
          if (networks.isEmpty) {
             return const DashboardSummaryEntity(
              activeNetwork: null,
              isOnline: false,
              pingMs: 0,
              latestDownloadMbps: 0,
              latestUploadMbps: 0,
              totalDevices: 0,
              newDevices: 0,
              securityScore: 100,
              securityRiskLevel: 'Low',
              todaysUsageBytes: 0,
              latestInsight: null,
              activeAlerts: [],
            );
          }

          final activeNetwork = networks.first;
          
          final isOnline = await _connectivityService.hasInternetReachability();

          final devicesResult = await _deviceRepository.getDevicesForNetwork(activeNetwork.id);
          final devices = devicesResult.getOrElse((_) => []);
          final newDevicesCount = devices.where((d) => 
            d.firstSeen.isAfter(DateTime.now().subtract(const Duration(hours: 24)))
          ).length;

          final usageResult = await _usageRepository.getUsageHistory(activeNetwork.id);
          final usageList = usageResult.getOrElse((_) => []);
          final todaysUsage = usageList.fold<double>(0, (sum, u) {
            if (u.timestamp.day == DateTime.now().day && u.timestamp.month == DateTime.now().month) {
               return sum + u.bytesDownloaded + u.bytesUploaded;
            }
            return sum;
          });

          final speedTestResult = await _usageRepository.getSpeedTests(activeNetwork.id);
          final speedTests = speedTestResult.getOrElse((_) => []);
          final latestSpeedTest = speedTests.isNotEmpty ? speedTests.first : null;

          return DashboardSummaryEntity(
            activeNetwork: activeNetwork,
            isOnline: isOnline,
            pingMs: latestSpeedTest?.pingMs ?? 0.0,
            latestDownloadMbps: latestSpeedTest?.downloadSpeedMbps ?? 0.0,
            latestUploadMbps: latestSpeedTest?.uploadSpeedMbps ?? 0.0,
            totalDevices: devices.length,
            newDevices: newDevicesCount,
            securityScore: 100, // To be aggregated from SecurityRepo in Module 9
            securityRiskLevel: 'Low',
            todaysUsageBytes: todaysUsage,
            latestInsight: null, // To be aggregated from AIInsightsRepo in Module 10
            activeAlerts: const [],
          );
        }
      );
    });
  }
}
