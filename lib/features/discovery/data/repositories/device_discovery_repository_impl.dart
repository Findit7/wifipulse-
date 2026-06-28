import 'dart:async';
import 'dart:isolate';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/repositories/device_discovery_repository.dart';
import '../../../devices/domain/entities/device_entity.dart';
import '../../../devices/domain/repositories/device_repository.dart';
import '../../../devices/domain/entities/device_history_entity.dart';
import '../../../sync/domain/repositories/sync_repository.dart';
import '../../../sync/domain/entities/sync_item_entity.dart';
import '../services/vendor_lookup_service.dart';
import '../services/classification_engine.dart';

class DeviceDiscoveryRepositoryImpl implements DeviceDiscoveryRepository {
  final DeviceRepository _deviceRepository;
  final SyncRepository _syncRepository;
  final VendorLookupService _vendorLookup;
  final ClassificationEngine _classificationEngine;

  DeviceDiscoveryRepositoryImpl(
    this._deviceRepository,
    this._syncRepository,
    this._vendorLookup,
    this._classificationEngine,
  );

  @override
  Future<Either<AppException, Stream<DeviceEntity>>> scanNetwork(
      String networkId) async {
    return ErrorHandler.execute(() async {
      final controller = StreamController<DeviceEntity>();
      final receivePort = ReceivePort();

      // Spawning isolate to ensure UI thread is never blocked during ping sweeps / ARP parsing
      await Isolate.spawn(_scanIsolate, receivePort.sendPort);

      receivePort.listen((message) async {
        if (message is _ScanDevicePayload) {
          final vendor = await _vendorLookup.lookupVendor(message.macAddress);
          final deviceType = await _classificationEngine.classify(
            vendor: vendor,
            hostname: message.hostname,
          );

          final device = DeviceEntity(
            id: 'dev_${DateTime.now().millisecondsSinceEpoch}_${message.ipAddress.replaceAll('.', '')}',
            networkId: networkId,
            macAddress: message.macAddress,
            ipAddress: message.ipAddress,
            hostname: message.hostname,
            vendor: vendor,
            deviceType: deviceType,
            isTrusted: false,
            isOnline: true,
            firstSeen: DateTime.now(),
            lastSeen: DateTime.now(),
          );

          // Write to DB without blocking discovery
          await _deviceRepository.saveDevice(device);
          await _deviceRepository.saveDeviceHistory(DeviceHistoryEntity(
            id: 'hist_${DateTime.now().millisecondsSinceEpoch}',
            deviceId: device.id,
            eventType: 'connected',
            timestamp: DateTime.now(),
          ));

          await _syncRepository.enqueueSyncItem(SyncItemEntity(
            entityType: 'Device',
            entityId: device.id,
            action: 'CREATE',
            payload: '{"mac_address": "${message.macAddress}"}',
            status: 'PENDING',
            retryCount: 0,
            createdAt: DateTime.now(),
          ));

          controller.add(device);
        } else if (message == 'DONE') {
          controller.close();
          receivePort.close();
        } else if (message is Exception) {
          controller.addError(message);
          controller.close();
          receivePort.close();
        }
      });

      return controller.stream;
    });
  }

  @override
  Future<Either<AppException, List<DeviceEntity>>> discoverDevices(
      String networkId) async {
    return ErrorHandler.execute(() async {
      return [];
    });
  }

  @override
  Future<Either<AppException, String>> fingerprintDevice(
      String macAddress, String ipAddress) async {
    return ErrorHandler.execute(() async => "fp_hash_simulated");
  }

  @override
  Future<Either<AppException, String>> classifyDevice(
      String macAddress, String? vendor, String? osGuess) async {
    return ErrorHandler.execute(
        () => _classificationEngine.classify(vendor: vendor, osGuess: osGuess));
  }

  static void _scanIsolate(SendPort sendPort) async {
    try {
      // Realistic representation of ARP + Ping Sweep operations
      const baseIp = '192.168.1.';

      // Simulate yielding found devices incrementally
      for (int i = 2; i <= 10; i++) {
        await Future.delayed(const Duration(milliseconds: 300));
        sendPort.send(_ScanDevicePayload(
          ipAddress: '$baseIp$i',
          macAddress: '00:1A:11:XX:YY:0$i',
          hostname: i % 3 == 0 ? 'sim-device-$i' : null,
        ));
      }

      sendPort.send('DONE');
    } catch (e) {
      sendPort.send(Exception('Isolate Scan Failed: $e'));
    }
  }
}

class _ScanDevicePayload {
  final String ipAddress;
  final String macAddress;
  final String? hostname;
  const _ScanDevicePayload(
      {required this.ipAddress, required this.macAddress, this.hostname});
}
