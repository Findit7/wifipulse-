import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../models/router_capabilities.dart';
import '../models/router_auth_session.dart';
import '../../../devices/domain/entities/device_entity.dart';

abstract class IRouterAdapter {
  String get vendor;
  String get model;
  RouterCapabilities get capabilities;
  
  Future<Either<AppException, RouterAuthSession>> authenticate(String username, String password);
  Future<Either<AppException, List<DeviceEntity>>> getConnectedDevices(RouterAuthSession session);
  Future<Either<AppException, void>> blockDevice(RouterAuthSession session, String macAddress);
  Future<Either<AppException, void>> unblockDevice(RouterAuthSession session, String macAddress);
  Future<Either<AppException, String>> getFirmwareVersion(RouterAuthSession session);
}
