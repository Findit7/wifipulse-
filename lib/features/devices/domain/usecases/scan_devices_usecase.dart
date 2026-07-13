import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/device_entity.dart';
import '../repositories/device_repository.dart';

part 'scan_devices_usecase.g.dart';

class ScanDevicesUseCase {
  final DeviceRepository repository;

  ScanDevicesUseCase(this.repository);

  Future<Result<List<DeviceEntity>>> execute(String networkId) {
    return repository.scanForDevices(networkId);
  }
}

@riverpod
ScanDevicesUseCase scanDevicesUseCase(ScanDevicesUseCaseRef ref) {
  return ScanDevicesUseCase(ref.watch(deviceRepositoryProvider));
}
