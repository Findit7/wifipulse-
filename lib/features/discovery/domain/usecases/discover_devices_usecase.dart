import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../devices/domain/entities/device_entity.dart';
import '../repositories/device_discovery_repository.dart';

class DiscoverDevicesUseCase {
  final DeviceDiscoveryRepository _repository;

  DiscoverDevicesUseCase(this._repository);

  Future<Either<AppException, List<DeviceEntity>>> execute(String networkId) {
    return _repository.discoverDevices(networkId);
  }
}
