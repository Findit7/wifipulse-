import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/device_entity.dart';
import '../repositories/device_repository.dart';

part 'get_device_details_usecase.g.dart';

class GetDeviceDetailsUseCase {
  final DeviceRepository repository;

  GetDeviceDetailsUseCase(this.repository);

  Future<Result<DeviceEntity>> execute(String deviceId) {
    return repository.getDeviceDetails(deviceId);
  }
}

@riverpod
GetDeviceDetailsUseCase getDeviceDetailsUseCase(GetDeviceDetailsUseCaseRef ref) {
  return GetDeviceDetailsUseCase(ref.watch(deviceRepositoryProvider));
}
