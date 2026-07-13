import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/device_entity.dart';
import '../../domain/usecases/get_saved_devices_usecase.dart';
import '../../domain/usecases/scan_devices_usecase.dart';
import '../../domain/usecases/update_device_trust_status_usecase.dart';
import '../../../../shared/network/providers/network_providers.dart';

part 'device_provider.freezed.dart';
part 'device_provider.g.dart';

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState.idle() = _Idle;
  const factory DeviceState.scanning(List<DeviceEntity> savedDevices) = _Scanning;
  const factory DeviceState.loaded(List<DeviceEntity> devices) = _Loaded;
  const factory DeviceState.error(String message) = _Error;
}

@riverpod
class DeviceController extends _$DeviceController {
  @override
  DeviceState build() {
    // Initial fetch of saved devices from DB
    _loadSavedDevices();
    return const DeviceState.idle();
  }

  Future<void> _loadSavedDevices() async {
    final wifiInfo = ref.read(wifiInfoServiceProvider).currentWifiInfo;
    final bssid = wifiInfo?.bssid ?? 'unknown_bssid';

    final usecase = ref.read(getSavedDevicesUseCaseProvider);
    final result = await usecase.execute(bssid);

    result.fold(
      (failure) => state = DeviceState.error(failure.message),
      (devices) => state = DeviceState.loaded(devices),
    );
  }

  Future<void> scanNetwork() async {
    final currentDevices = state.maybeMap(
      loaded: (s) => s.devices,
      orElse: () => <DeviceEntity>[],
    );
    state = DeviceState.scanning(currentDevices);

    final wifiInfo = ref.read(wifiInfoServiceProvider).currentWifiInfo;
    final bssid = wifiInfo?.bssid ?? 'unknown_bssid';

    final scanUseCase = ref.read(scanDevicesUseCaseProvider);
    final result = await scanUseCase.execute(bssid);

    result.fold(
      (failure) => state = DeviceState.error(failure.message),
      (devices) {
        // Refresh saved devices from DB after scan completes to get the unified list
        _loadSavedDevices();
      },
    );
  }

  Future<void> updateTrustStatus(String deviceId, bool isTrusted) async {
    final usecase = ref.read(updateDeviceTrustStatusUseCaseProvider);
    final result = await usecase.execute(deviceId, isTrusted);

    result.fold(
      (failure) => state = DeviceState.error(failure.message),
      (_) => _loadSavedDevices(), // Reload to show updated status
    );
  }
}
