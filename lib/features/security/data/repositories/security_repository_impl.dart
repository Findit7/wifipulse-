import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/repositories/security_repository.dart';
import '../../domain/entities/alert_entity.dart';
import '../../domain/entities/security_score_entity.dart';
import '../engines/security_audit_engine.dart';
import '../datasources/security_local_data_source.dart';
import '../../../devices/domain/entities/device_entity.dart';

class SecurityRepositoryImpl implements SecurityRepository {
  final SecurityAuditEngine _auditEngine;
  final SecurityLocalDataSource _localDataSource;
  final bool _securityAlertsEnabled; // Typically injected via NotificationPreferences service

  SecurityRepositoryImpl(
    this._auditEngine, 
    this._localDataSource,
    {bool securityAlertsEnabled = true}
  ) : _securityAlertsEnabled = securityAlertsEnabled;

  @override
  Future<Either<AppException, SecurityScoreEntity>> runSecurityAudit(String networkId, List<DeviceEntity> localDevices) async {
    return ErrorHandler.execute(() async {
      final audit = _auditEngine.performAudit(
        networkId: networkId,
        localDevices: localDevices,
        routerAdapter: null, 
        isRouterAuthenticated: false,
      );

      await _localDataSource.saveSecurityScore(audit);

      if (_securityAlertsEnabled) {
        final newAlerts = _auditEngine.generateAlerts(audit, networkId);
        if (newAlerts.isNotEmpty) {
          await _localDataSource.saveAlerts(newAlerts);
        }
      }

      return audit;
    });
  }

  @override
  Future<Either<AppException, List<AlertEntity>>> getActiveAlerts(String networkId) async {
    return ErrorHandler.execute(() async {
      return _localDataSource.getUnreadAlerts(networkId);
    });
  }

  @override
  Future<Either<AppException, void>> resolveAlert(String alertId) async {
    return ErrorHandler.execute(() async {
      return _localDataSource.markAlertAsRead(alertId);
    });
  }
}
