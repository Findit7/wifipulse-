import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/alert_entity.dart';
import '../entities/security_score_entity.dart';

import '../../../devices/domain/entities/device_entity.dart';

abstract class SecurityRepository {
  Future<Either<AppException, SecurityScoreEntity>> runSecurityAudit(String networkId, List<DeviceEntity> localDevices);
  Future<Either<AppException, List<AlertEntity>>> getActiveAlerts(String networkId);
  Future<Either<AppException, void>> resolveAlert(String alertId);
}
