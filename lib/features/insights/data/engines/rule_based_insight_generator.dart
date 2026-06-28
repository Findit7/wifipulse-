import '../../domain/entities/ai_insight_entity.dart';
import '../../../security/domain/entities/security_score_entity.dart';
import '../../../usage/domain/entities/usage_summary_entity.dart';

class RuleBasedInsightGenerator {
  AIInsightEntity generateFallbackInsight({
    required String networkId,
    required SecurityScoreEntity securityScore,
    required UsageSummaryEntity usageSummary,
  }) {
    String insightText = "Your network is performing normally. No anomalies detected.";
    String category = "Performance";

    // 1. Security Check Priority
    if (securityScore.overallScore < 50) {
      insightText = "Critical security issues detected. Please review your alerts and consider updating your Wi-Fi password.";
      category = "Security";
    } else if (securityScore.untrustedDevicesCount > 0) {
      insightText = "You have ${securityScore.untrustedDevicesCount} untrusted device(s) connected. Verify these to ensure your network is secure.";
      category = "Security";
    } 
    // 2. Usage Check Priority
    else if (usageSummary.topConsumers.isNotEmpty && usageSummary.topConsumers.first.totalBytes > (5 * 1024 * 1024 * 1024)) {
      final topDevice = usageSummary.topConsumers.first;
      final mb = topDevice.totalBytes / (1024 * 1024);
      final name = topDevice.device.customName ?? topDevice.device.hostname ?? 'An unknown device';
      insightText = "$name has consumed over ${(mb / 1024).toStringAsFixed(1)} GB of data recently. Monitor this to avoid ISP throttling.";
      category = "Usage";
    } 
    // 3. Analytics
    else if (securityScore.overallScore == 100) {
      insightText = "Great job! Your network is 100% secure with no active threats or untrusted devices.";
      category = "Security";
    }

    return AIInsightEntity(
      id: 'fallback_${DateTime.now().millisecondsSinceEpoch}',
      networkId: networkId,
      insightText: insightText,
      category: category,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 4)), 
      isLocallyGenerated: true,
    );
  }
}
