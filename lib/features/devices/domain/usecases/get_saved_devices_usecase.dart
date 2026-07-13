import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/device_entity.dart';
import '../repositories/device_repository.dart';

part 'get_saved_devices_usecase.g.dart';

class GetSavedDevicesUseCase {
  final DeviceRepository repository;

  GetSavedDevicesUseCase(this.repository);

  Future<Result<List<DeviceEntity>>> execute(String networkId) {
    return repository.getDevicesForNetwork(networkId);
  }
}

@riverpod
GetSavedDevicesUseCase getSavedDevicesUseCase(GetSavedDevicesUseCaseRef ref) {
  return GetSavedDevicesUseCase(ref.watch(deviceRepositoryProvider));
}
