import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/devices.dart';

part 'device_dao.g.dart';

@DriftAccessor(tables: [Devices])
class DeviceDao extends DatabaseAccessor<AppDatabase> with _$DeviceDaoMixin {
  DeviceDao(super.db);

  Future<List<DeviceEntry>> getAllDevices() => select(devices).get();
  
  Future<DeviceEntry?> getDeviceById(String id) =>
      (select(devices)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertDevice(DevicesCompanion device) => into(devices).insert(device);

  Future<bool> updateDevice(DevicesCompanion device) => update(devices).replace(device);

  Future<int> deleteDevice(String id) =>
      (delete(devices)..where((t) => t.id.equals(id))).go();
}
