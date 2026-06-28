import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../adapters/i_router_adapter.dart';
import '../repositories/router_control_repository.dart';

class DetectRouterUseCase {
  final RouterControlRepository _repository;

  DetectRouterUseCase(this._repository);

  Future<Either<AppException, IRouterAdapter>> execute(String gatewayIp, String? gatewayMac) {
    return _repository.detectRouter(gatewayIp, gatewayMac);
  }
}
