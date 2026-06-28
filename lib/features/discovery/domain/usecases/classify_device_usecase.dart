import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../repositories/device_discovery_repository.dart';

class ClassifyDeviceUseCase {
  final DeviceDiscoveryRepository _repository;

  ClassifyDeviceUseCase(this._repository);

  Future<Either<AppException, String>> execute({required String macAddress, String? vendor, String? osGuess}) {
    return _repository.classifyDevice(macAddress, vendor, osGuess);
  }
}
