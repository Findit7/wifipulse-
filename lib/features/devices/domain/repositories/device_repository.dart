import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/device_entity.dart';
import '../entities/device_history_entity.dart';

abstract class DeviceRepository {
  Future<Either<AppException, List<DeviceEntity>>> getDevicesForNetwork(String networkId);
  Future<Either<AppException, DeviceEntity>> getDeviceById(String deviceId);
  Future<Either<AppException, void>> saveDevice(DeviceEntity device);
  Future<Either<AppException, void>> saveDeviceHistory(DeviceHistoryEntity history);
}
