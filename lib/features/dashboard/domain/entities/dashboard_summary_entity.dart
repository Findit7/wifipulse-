import '../../../networks/domain/entities/network_entity.dart';
import '../../../security/domain/entities/alert_entity.dart';
import '../../../insights/domain/entities/ai_insight_entity.dart';

class DashboardSummaryEntity {
  final NetworkEntity? activeNetwork;
  final bool isOnline;
  final double pingMs;
  final double latestDownloadMbps;
  final double latestUploadMbps;
  final int totalDevices;
  final int newDevices;
  final int securityScore;
  final String securityRiskLevel;
  final double todaysUsageBytes;
  final AIInsightEntity? latestInsight;
  final List<AlertEntity> activeAlerts;

  const DashboardSummaryEntity({
    this.activeNetwork,
    required this.isOnline,
    required this.pingMs,
    required this.latestDownloadMbps,
    required this.latestUploadMbps,
    required this.totalDevices,
    required this.newDevices,
    required this.securityScore,
    required this.securityRiskLevel,
    required this.todaysUsageBytes,
    this.latestInsight,
    this.activeAlerts = const [],
  });
}
