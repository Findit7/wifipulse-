import '../../../../shared/utils/result.dart';
import '../entities/device_entity.dart';
import '../entities/device_history_entity.dart';

abstract class DeviceRepository {
  Future<Result<List<DeviceEntity>>> getDevicesForNetwork(String networkId);
  Future<Result<DeviceEntity>> getDeviceDetails(String deviceId);
  Future<Result<void>> saveDevice(DeviceEntity device);
  Future<Result<void>> updateDeviceTrustStatus(String deviceId, bool isTrusted);
  Future<Result<void>> saveDeviceHistory(DeviceHistoryEntity history);
  Future<Result<List<DeviceEntity>>> scanForDevices(String networkId);
}
