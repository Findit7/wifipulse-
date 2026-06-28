import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/alert_entity.dart';
import '../repositories/security_repository.dart';

class GetActiveAlertsUseCase {
  final SecurityRepository _repository;

  GetActiveAlertsUseCase(this._repository);

  Future<Either<AppException, List<AlertEntity>>> execute(String networkId) {
    return _repository.getActiveAlerts(networkId);
  }
}
