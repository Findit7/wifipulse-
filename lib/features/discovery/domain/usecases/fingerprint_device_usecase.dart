import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../repositories/device_discovery_repository.dart';

class FingerprintDeviceUseCase {
  final DeviceDiscoveryRepository _repository;

  FingerprintDeviceUseCase(this._repository);

  Future<Either<AppException, String>> execute({required String macAddress, required String ipAddress}) {
    return _repository.fingerprintDevice(macAddress, ipAddress);
  }
}
