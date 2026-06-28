import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/security_score_entity.dart';
import '../repositories/security_repository.dart';

import '../../../devices/domain/repositories/device_repository.dart';

class RunSecurityAuditUseCase {
  final SecurityRepository _repository;
  final DeviceRepository _deviceRepository;

  RunSecurityAuditUseCase(this._repository, this._deviceRepository);

  Future<Either<AppException, SecurityScoreEntity>> execute(String networkId) async {
    final devicesResult = await _deviceRepository.getDevicesForNetwork(networkId);
    final devices = devicesResult.getOrElse((_) => []);
    
    return _repository.runSecurityAudit(networkId, devices);
  }
}
