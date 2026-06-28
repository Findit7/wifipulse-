import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/adapters/i_router_adapter.dart';
import '../../domain/models/router_auth_session.dart';
import '../../domain/repositories/router_control_repository.dart';
import '../services/router_discovery_engine.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RouterControlRepositoryImpl implements RouterControlRepository {
  final RouterDiscoveryEngine _discoveryEngine;
  final FlutterSecureStorage _secureStorage;

  RouterControlRepositoryImpl(this._discoveryEngine, this._secureStorage);

  @override
  Future<Either<AppException, IRouterAdapter>> detectRouter(String gatewayIp, String? gatewayMac) async {
    return ErrorHandler.execute(() => _discoveryEngine.detectRouter(gatewayIp, gatewayMac));
  }

  @override
  Future<Either<AppException, RouterAuthSession>> authenticate(IRouterAdapter adapter, String username, String password) async {
    final result = await adapter.authenticate(username, password);
    return result.map((session) {
      _secureStorage.write(key: 'router_username', value: username);
      _secureStorage.write(key: 'router_password', value: password);
      return session;
    });
  }

  @override
  Future<Either<AppException, void>> blockDevice(IRouterAdapter adapter, RouterAuthSession session, String macAddress) async {
    return adapter.blockDevice(session, macAddress);
  }

  @override
  Future<Either<AppException, void>> unblockDevice(IRouterAdapter adapter, RouterAuthSession session, String macAddress) async {
    return adapter.unblockDevice(session, macAddress);
  }
}
