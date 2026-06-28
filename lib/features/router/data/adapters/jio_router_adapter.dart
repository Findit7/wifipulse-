import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../domain/adapters/i_router_adapter.dart';
import '../../domain/models/router_capabilities.dart';
import '../../domain/models/router_auth_session.dart';
import '../../../devices/domain/entities/device_entity.dart';

class JioRouterAdapter implements IRouterAdapter {
  final Dio _dio;
  final String _gatewayIp;

  JioRouterAdapter(this._dio, this._gatewayIp);

  @override
  String get vendor => 'JioFiber';

  @override
  String get model => 'JCOW400';

  @override
  RouterCapabilities get capabilities => const RouterCapabilities(
        canListDevices: true,
        canBlockDevices: true,
        canUnblockDevices: true,
        canMonitorUsage: true,
        canManageGuestNetwork: true,
      );

  @override
  Future<Either<AppException, RouterAuthSession>> authenticate(
      String username, String password) async {
    return const Left(
        ServerException('Not yet implemented: Jio authentication.'));
  }

  @override
  Future<Either<AppException, List<DeviceEntity>>> getConnectedDevices(
      RouterAuthSession session) async {
    return const Left(
        ServerException('Not yet implemented: Jio getConnectedDevices.'));
  }

  @override
  Future<Either<AppException, void>> blockDevice(
      RouterAuthSession session, String macAddress) async {
    return const Left(ServerException('Not yet implemented: Jio blockDevice.'));
  }

  @override
  Future<Either<AppException, void>> unblockDevice(
      RouterAuthSession session, String macAddress) async {
    return const Left(
        ServerException('Not yet implemented: Jio unblockDevice.'));
  }

  @override
  Future<Either<AppException, String>> getFirmwareVersion(
      RouterAuthSession session) async {
    return const Left(
        ServerException('Not yet implemented: Jio getFirmwareVersion.'));
  }
}
