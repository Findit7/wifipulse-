import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../domain/adapters/i_router_adapter.dart';
import '../../domain/models/router_capabilities.dart';
import '../../domain/models/router_auth_session.dart';
import '../../../devices/domain/entities/device_entity.dart';

class GenericRouterAdapter implements IRouterAdapter {
  final Dio _dio;
  final String _gatewayIp;

  GenericRouterAdapter(this._dio, this._gatewayIp);

  @override
  String get vendor => 'Generic';

  @override
  String get model => 'Unknown';

  @override
  RouterCapabilities get capabilities => RouterCapabilities.generic();

  @override
  Future<Either<AppException, RouterAuthSession>> authenticate(
      String username, String password) async {
    return const Left(
        ServerException('Generic routers do not support automated login.'));
  }

  @override
  Future<Either<AppException, List<DeviceEntity>>> getConnectedDevices(
      RouterAuthSession session) async {
    return const Left(ServerException('Unsupported action'));
  }

  @override
  Future<Either<AppException, void>> blockDevice(
      RouterAuthSession session, String macAddress) async {
    return const Left(ServerException('Unsupported action'));
  }

  @override
  Future<Either<AppException, void>> unblockDevice(
      RouterAuthSession session, String macAddress) async {
    return const Left(ServerException('Unsupported action'));
  }

  @override
  Future<Either<AppException, String>> getFirmwareVersion(
      RouterAuthSession session) async {
    return const Left(ServerException('Unsupported action'));
  }
}
