import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../adapters/i_router_adapter.dart';
import '../models/router_auth_session.dart';

abstract class RouterControlRepository {
  Future<Either<AppException, IRouterAdapter>> detectRouter(String gatewayIp, String? gatewayMac);
  Future<Either<AppException, RouterAuthSession>> authenticate(IRouterAdapter adapter, String username, String password);
  Future<Either<AppException, void>> blockDevice(IRouterAdapter adapter, RouterAuthSession session, String macAddress);
  Future<Either<AppException, void>> unblockDevice(IRouterAdapter adapter, RouterAuthSession session, String macAddress);
}
