import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/result.dart';
import '../../../../shared/network/scanner/network_scanner.dart';
import '../../../../shared/network/models/wifi_info.dart';
import '../../domain/entities/device_entity.dart';
import '../../domain/entities/device_history_entity.dart';
import '../../domain/repositories/device_repository.dart';
import '../datasources/device_local_data_source.dart';
import '../models/device_model.dart';
import '../models/device_history_model.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSource _localDataSource;
  final NetworkScanner _networkScanner;

  DeviceRepositoryImpl(this._localDataSource, this._networkScanner);

  @override
  Future<Result<void>> saveDevice(DeviceEntity device) async {
    try {
      await _localDataSource.saveDevice(DeviceModel.fromEntity(device));
      return right(null);
    } catch (e) {
      return left(DatabaseFailure('Failed to save device: $e'));
    }
  }

  @override
  Future<Result<DeviceEntity>> getDeviceDetails(String deviceId) async {
    try {
      final device = await _localDataSource.getDevice(deviceId);
      if (device == null) return left(const DatabaseFailure('Device not found.'));
      return right(device);
    } catch (e) {
      return left(DatabaseFailure('Failed to get device: $e'));
    }
  }

  @override
  Future<Result<List<DeviceEntity>>> getDevicesForNetwork(String networkId) async {
    try {
      final devices = await _localDataSource.getDevicesForNetwork(networkId);
      return right(devices);
    } catch (e) {
      return left(DatabaseFailure('Failed to get devices: $e'));
    }
  }

  @override
  Future<Result<void>> saveDeviceHistory(DeviceHistoryEntity history) async {
    try {
      await _localDataSource.saveDeviceHistory(DeviceHistoryModel.fromEntity(history));
      return right(null);
    } catch (e) {
      return left(DatabaseFailure('Failed to save device history: $e'));
    }
  }

  @override
  Future<Result<void>> updateDeviceTrustStatus(String deviceId, bool isTrusted) async {
    try {
      final deviceResult = await getDeviceDetails(deviceId);
      return await deviceResult.fold(
        (l) async => left(l),
        (device) async {
          final updatedDevice = DeviceEntity(
            id: device.id,
            networkId: device.networkId,
            macAddress: device.macAddress,
            ipAddress: device.ipAddress,
            hostname: device.hostname,
            customName: device.customName,
            vendor: device.vendor,
            deviceType: device.deviceType,
            osGuess: device.osGuess,
            fingerprintHash: device.fingerprintHash,
            isTrusted: isTrusted,
            isOnline: device.isOnline,
            firstSeen: device.firstSeen,
            lastSeen: device.lastSeen,
            riskScore: device.riskScore,
          );
          await saveDevice(updatedDevice);
          return right(null);
        }
      );
    } catch (e) {
      return left(DatabaseFailure('Failed to update trust status: $e'));
    }
  }

  @override
  Future<Result<List<DeviceEntity>>> scanForDevices(String networkId) async {
    try {
      // In a real app, we'd fetch the current WifiInfo from WifiInfoService
      final wifiInfo = WifiInfo(
        ssid: 'CurrentNetwork',
        bssid: networkId,
        localIp: '192.168.1.10', // Mocked, ideally from provider
        connectionType: 'WiFi',
      );
      
      final scanResult = await _networkScanner.deepScan(wifiInfo);
      
      return scanResult.fold(
        (failure) => left(failure),
        (devices) async {
           // Save discovered devices to local DB
           for (final device in devices) {
              await saveDevice(device);
              // TODO: Security Event if unknown device
           }
           return right(devices);
        }
      );
    } catch (e) {
      return left(NetworkFailure('Failed to scan for devices: $e'));
    }
  }
}
