import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/scan_network_usecase.dart';
import '../../../devices/domain/entities/device_entity.dart';
import '../../../../core/di/repository_providers.dart';

part 'discovery_provider.g.dart';

class DiscoveryState {
  final bool isScanning;
  final List<DeviceEntity> discoveredDevices;
  final String? error;
  final int progressCount;

  const DiscoveryState({
    this.isScanning = false,
    this.discoveredDevices = const [],
    this.error,
    this.progressCount = 0,
  });

  DiscoveryState copyWith({
    bool? isScanning,
    List<DeviceEntity>? discoveredDevices,
    String? error,
    int? progressCount,
  }) {
    return DiscoveryState(
      isScanning: isScanning ?? this.isScanning,
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
      error: error, // Clearable
      progressCount: progressCount ?? this.progressCount,
    );
  }
}

@riverpod
ScanNetworkUseCase scanNetworkUseCase(ScanNetworkUseCaseRef ref) {
  return ScanNetworkUseCase(ref.watch(deviceDiscoveryRepositoryProvider));
}

@riverpod
class DiscoveryController extends _$DiscoveryController {
  StreamSubscription<DeviceEntity>? _scanSubscription;

  @override
  DiscoveryState build() {
    ref.onDispose(() {
      _scanSubscription?.cancel();
    });
    return const DiscoveryState();
  }

  Future<void> startScan(String networkId) async {
    if (state.isScanning) return;

    state = state.copyWith(isScanning: true, error: null, discoveredDevices: [], progressCount: 0);

    final useCase = ref.read(scanNetworkUseCaseProvider);
    final result = await useCase.execute(networkId);

    result.fold(
      (error) {
        state = state.copyWith(isScanning: false, error: error.message);
      },
      (deviceStream) {
        _scanSubscription = deviceStream.listen(
          (device) {
            // Provide live UI updates
            final updatedDevices = List<DeviceEntity>.from(state.discoveredDevices)..add(device);
            state = state.copyWith(
              discoveredDevices: updatedDevices,
              progressCount: state.progressCount + 1,
            );
          },
          onError: (e) {
            state = state.copyWith(isScanning: false, error: e.toString());
          },
          onDone: () {
            state = state.copyWith(isScanning: false);
          },
        );
      },
    );
  }

  void stopScan() {
    _scanSubscription?.cancel();
    state = state.copyWith(isScanning: false);
  }
}
