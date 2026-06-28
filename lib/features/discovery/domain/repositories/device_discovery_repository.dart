import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../devices/domain/entities/device_entity.dart';

abstract class DeviceDiscoveryRepository {
  Future<Either<AppException, Stream<DeviceEntity>>> scanNetwork(String networkId);
  Future<Either<AppException, List<DeviceEntity>>> discoverDevices(String networkId);
  Future<Either<AppException, String>> fingerprintDevice(String macAddress, String ipAddress);
  Future<Either<AppException, String>> classifyDevice(String macAddress, String? vendor, String? osGuess);
}
