import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../adapters/i_router_adapter.dart';
import '../models/router_auth_session.dart';
import '../repositories/router_control_repository.dart';

class BlockDeviceUseCase {
  final RouterControlRepository _repository;

  BlockDeviceUseCase(this._repository);

  Future<Either<AppException, void>> execute(IRouterAdapter adapter, RouterAuthSession session, String macAddress) {
    return _repository.blockDevice(adapter, session, macAddress);
  }
}
