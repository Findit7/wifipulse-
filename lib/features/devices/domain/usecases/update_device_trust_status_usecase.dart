import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../../../../core/di/repository_providers.dart';
import '../repositories/device_repository.dart';

part 'update_device_trust_status_usecase.g.dart';

class UpdateDeviceTrustStatusUseCase {
  final DeviceRepository repository;

  UpdateDeviceTrustStatusUseCase(this.repository);

  Future<Result<void>> execute(String deviceId, bool isTrusted) {
    return repository.updateDeviceTrustStatus(deviceId, isTrusted);
  }
}

@riverpod
UpdateDeviceTrustStatusUseCase updateDeviceTrustStatusUseCase(UpdateDeviceTrustStatusUseCaseRef ref) {
  return UpdateDeviceTrustStatusUseCase(ref.watch(deviceRepositoryProvider));
}
