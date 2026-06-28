import 'package:sqflite/sqflite.dart';
import '../../../../core/database/database_helper.dart';
import '../../../../core/error/app_exception.dart';
import '../models/device_model.dart';
import '../models/device_history_model.dart';

abstract class DeviceLocalDataSource {
  Future<void> saveDevice(DeviceModel device);
  Future<DeviceModel?> getDevice(String id);
  Future<List<DeviceModel>> getDevicesForNetwork(String networkId);
  Future<void> saveDeviceHistory(DeviceHistoryModel history);
  Future<List<DeviceHistoryModel>> getHistoryForDevice(String deviceId);
}

class DeviceLocalDataSourceImpl implements DeviceLocalDataSource {
  @override
  Future<void> saveDevice(DeviceModel device) async {
    try {
      final db = await DatabaseHelper.init();
      await db.insert('Devices', device.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw LocalDatabaseException('Failed to save device', originalError: e);
    }
  }

  @override
  Future<DeviceModel?> getDevice(String id) async {
    try {
      final db = await DatabaseHelper.init();
      final maps = await db.query('Devices', where: 'id = ?', whereArgs: [id]);
      if (maps.isNotEmpty) return DeviceModel.fromMap(maps.first);
      return null;
    } catch (e) {
      throw LocalDatabaseException('Failed to get device', originalError: e);
    }
  }

  @override
  Future<List<DeviceModel>> getDevicesForNetwork(String networkId) async {
    try {
      final db = await DatabaseHelper.init();
      final maps = await db.query('Devices', where: 'network_id = ?', whereArgs: [networkId]);
      return maps.map((m) => DeviceModel.fromMap(m)).toList();
    } catch (e) {
      throw LocalDatabaseException('Failed to get devices for network', originalError: e);
    }
  }

  @override
  Future<void> saveDeviceHistory(DeviceHistoryModel history) async {
    try {
      final db = await DatabaseHelper.init();
      await db.insert('DeviceHistory', history.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw LocalDatabaseException('Failed to save device history', originalError: e);
    }
  }

  @override
  Future<List<DeviceHistoryModel>> getHistoryForDevice(String deviceId) async {
    try {
      final db = await DatabaseHelper.init();
      final maps = await db.query('DeviceHistory', where: 'device_id = ?', whereArgs: [deviceId], orderBy: 'timestamp DESC');
      return maps.map((m) => DeviceHistoryModel.fromMap(m)).toList();
    } catch (e) {
      throw LocalDatabaseException('Failed to get device history', originalError: e);
    }
  }
}
