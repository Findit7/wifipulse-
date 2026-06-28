import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../devices/domain/entities/device_entity.dart';
import '../repositories/device_discovery_repository.dart';

class ScanNetworkUseCase {
  final DeviceDiscoveryRepository _repository;

  ScanNetworkUseCase(this._repository);

  Future<Either<AppException, Stream<DeviceEntity>>> execute(String networkId) {
    return _repository.scanNetwork(networkId);
  }
}
