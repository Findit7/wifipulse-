import '../../domain/entities/alert_entity.dart';
import '../../domain/entities/security_score_entity.dart';
import '../../../router/domain/adapters/i_router_adapter.dart';
import '../../../devices/domain/entities/device_entity.dart';

class SecurityAuditEngine {
  SecurityScoreEntity performAudit({
    required String networkId,
    required List<DeviceEntity> localDevices,
    IRouterAdapter? routerAdapter,
    String? routerFirmwareVersion,
    bool isRouterAuthenticated = false,
  }) {
    int score = 100;
    final List<String> passed = [];
    final List<String> failed = [];
    final List<String> unsupported = [];

    // --- LOCAL CHECKS ---
    final untrustedDevices = localDevices.where((d) => !d.isTrusted).length;
    if (untrustedDevices > 0) {
      score -= (untrustedDevices * 10);
      failed.add(
          '$untrustedDevices untrusted device(s) detected on the network.');
    } else {
      passed.add('All known devices are marked as trusted.');
    }

    // --- ROUTER-DEPENDENT CHECKS ---
    if (routerAdapter != null) {
      unsupported.add(
          'Default router password check (Requires specific router vulnerability payload).');

      if (routerAdapter.capabilities.canManageGuestNetwork) {
        passed.add('Guest network capability verified.');
      } else {
        unsupported
            .add('Router lacks guest network isolation capability APIs.');
      }
    } else {
      unsupported
          .add('Wi-Fi Encryption Type (Requires unsupported router API).');
      unsupported.add(
          'Default router admin password check (Requires router adapter).');
      unsupported.add('Guest network verification (Requires router adapter).');
    }

    // --- BACKEND-ASSISTED CHECKS ---
    if (routerFirmwareVersion != null) {
      unsupported.add(
          'Firmware vulnerability check (Backend lookup pending for $routerFirmwareVersion).');
    } else {
      unsupported.add(
          'Firmware vulnerability check (Requires router firmware version).');
    }

    score = score.clamp(0, 100);

    String risk = 'Low';
    if (score < 50) {
      risk = 'Critical';
    } else if (score < 75)
      risk = 'High';
    else if (score < 90) risk = 'Medium';

    return SecurityScoreEntity(
      id: 'score_${DateTime.now().millisecondsSinceEpoch}',
      networkId: networkId,
      overallScore: score,
      untrustedDevicesCount: untrustedDevices,
      encryptionType: null,
      openPortsDetected: {},
      timestamp: DateTime.now(),
      riskLevel: risk,
      passedChecks: passed,
      failedChecks: failed,
      unsupportedChecks: unsupported,
    );
  }

  List<AlertEntity> generateAlerts(
      SecurityScoreEntity audit, String networkId) {
    final List<AlertEntity> alerts = [];

    if (audit.failedChecks.isNotEmpty) {
      for (var failure in audit.failedChecks) {
        alerts.add(AlertEntity(
          id: 'alert_${DateTime.now().millisecondsSinceEpoch}_${alerts.length}',
          networkId: networkId,
          type: 'SECURITY_DROP',
          title: 'Security Vulnerability Detected',
          message: failure,
          createdAt: DateTime.now(),
          isRead: false,
        ));
      }
    }

    return alerts;
  }
}
