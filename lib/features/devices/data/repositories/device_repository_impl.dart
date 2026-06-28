import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/device_entity.dart';
import '../../domain/entities/device_history_entity.dart';
import '../../domain/repositories/device_repository.dart';
import '../datasources/device_local_data_source.dart';
import '../models/device_model.dart';
import '../models/device_history_model.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSource _localDataSource;

  DeviceRepositoryImpl(this._localDataSource);

  @override
  Future<Either<AppException, void>> saveDevice(DeviceEntity device) async {
    return ErrorHandler.execute(() => _localDataSource.saveDevice(DeviceModel.fromEntity(device)));
  }

  @override
  Future<Either<AppException, DeviceEntity>> getDeviceById(String deviceId) async {
    return ErrorHandler.execute(() async {
      final device = await _localDataSource.getDevice(deviceId);
      if (device == null) throw const LocalDatabaseException('Device not found.');
      return device;
    });
  }

  @override
  Future<Either<AppException, List<DeviceEntity>>> getDevicesForNetwork(String networkId) async {
    return ErrorHandler.execute(() => _localDataSource.getDevicesForNetwork(networkId));
  }

  @override
  Future<Either<AppException, void>> saveDeviceHistory(DeviceHistoryEntity history) async {
    return ErrorHandler.execute(() => _localDataSource.saveDeviceHistory(DeviceHistoryModel.fromEntity(history)));
  }

  @override
  Future<Either<AppException, List<DeviceHistoryEntity>>> getHistoryForDevice(String deviceId) async {
    return ErrorHandler.execute(() => _localDataSource.getHistoryForDevice(deviceId));
  }
}
