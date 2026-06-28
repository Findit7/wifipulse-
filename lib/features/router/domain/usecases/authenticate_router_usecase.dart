import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../adapters/i_router_adapter.dart';
import '../models/router_auth_session.dart';
import '../repositories/router_control_repository.dart';

class AuthenticateRouterUseCase {
  final RouterControlRepository _repository;

  AuthenticateRouterUseCase(this._repository);

  Future<Either<AppException, RouterAuthSession>> execute(IRouterAdapter adapter, String username, String password) {
    return _repository.authenticate(adapter, username, password);
  }
}
