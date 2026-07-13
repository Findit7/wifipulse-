import 'package:flutter_test/flutter_test.dart';
import 'package:wifi_pulse/features/devices/presentation/providers/device_provider.dart';
import 'package:wifi_pulse/features/devices/domain/entities/device_entity.dart';

void main() {
  group('DeviceState', () {
    test('idle factory constructor creates correct state', () {
      final state = DeviceState.idle();
      
      expect(
        state.whenOrNull(
          idle: () => true,
        ),
        isTrue,
      );
    });

    test('scanning factory constructor creates correct state', () {
      final devices = [
        DeviceEntity(
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
        )
      ];
      
      final state = DeviceState.scanning(devices);
      
      expect(
        state.whenOrNull(
          scanning: (d) => d == devices,
        ),
        isTrue,
      );
    });

    test('ready factory constructor creates correct state', () {
      final devices = [
        DeviceEntity(
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
        )
      ];
      
      final state = DeviceState.ready(devices);
      
      expect(
        state.whenOrNull(
          ready: (d) => d == devices,
        ),
        isTrue,
      );
    });

    test('error factory constructor creates correct state', () {
      final state = DeviceState.error('Failed to scan', null);
      
      expect(
        state.whenOrNull(
          error: (msg, saved) => msg == 'Failed to scan',
        ),
        isTrue,
      );
    });
  });
}
