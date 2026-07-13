import 'package:flutter_test/flutter_test.dart';
import 'package:wifi_pulse/features/devices/domain/entities/device_entity.dart';

void main() {
  group('DeviceEntity', () {
    test('supports value comparisons', () {
      final device1 = DeviceEntity(
        id: '1',
        networkId: 'network1',
        deviceName: 'Phone',
        ipAddress: '192.168.1.5',
        macAddress: '00:11:22:33:44:55',
        vendor: 'Apple',
        deviceType: 'Smartphone',
        connectionStatus: 'Connected',
        firstSeen: DateTime(2023, 1, 1),
        lastSeen: DateTime(2023, 1, 1),
        isTrusted: true,
        riskScore: 0.1,
      );

      final device2 = DeviceEntity(
        id: '1',
        networkId: 'network1',
        deviceName: 'Phone',
        ipAddress: '192.168.1.5',
        macAddress: '00:11:22:33:44:55',
        vendor: 'Apple',
        deviceType: 'Smartphone',
        connectionStatus: 'Connected',
        firstSeen: DateTime(2023, 1, 1),
        lastSeen: DateTime(2023, 1, 1),
        isTrusted: true,
        riskScore: 0.1,
      );

      final device3 = DeviceEntity(
        id: '2',
        networkId: 'network1',
        deviceName: 'Phone',
        ipAddress: '192.168.1.5',
        macAddress: '00:11:22:33:44:55',
        vendor: 'Apple',
        deviceType: 'Smartphone',
        connectionStatus: 'Connected',
        firstSeen: DateTime(2023, 1, 1),
        lastSeen: DateTime(2023, 1, 1),
        isTrusted: true,
        riskScore: 0.1,
      );

      expect(device1, equals(device2));
      expect(device1, isNot(equals(device3)));
    });

    test('copyWith updates fields correctly', () {
      final device = DeviceEntity(
        id: '1',
        networkId: 'network1',
        deviceName: 'Phone',
        ipAddress: '192.168.1.5',
        macAddress: '00:11:22:33:44:55',
        vendor: 'Apple',
        deviceType: 'Smartphone',
        connectionStatus: 'Connected',
        firstSeen: DateTime(2023, 1, 1),
        lastSeen: DateTime(2023, 1, 1),
        isTrusted: true,
        riskScore: 0.1,
      );

      final updated = device.copyWith(
        deviceName: 'Laptop',
        isTrusted: false,
      );

      expect(updated.deviceName, equals('Laptop'));
      expect(updated.isTrusted, equals(false));
      expect(updated.id, equals('1'));
      expect(updated.ipAddress, equals('192.168.1.5'));
    });
  });
}
