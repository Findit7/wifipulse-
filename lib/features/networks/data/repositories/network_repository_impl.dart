import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/network_entity.dart';
import '../../domain/entities/router_entity.dart';
import '../../domain/repositories/network_repository.dart';
import '../datasources/network_local_data_source.dart';
import '../models/network_model.dart';
import '../models/router_model.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final NetworkLocalDataSource _localDataSource;

  NetworkRepositoryImpl(this._localDataSource);

  @override
  Future<Either<AppException, void>> saveNetwork(NetworkEntity network) async {
    return ErrorHandler.execute(() => _localDataSource.saveNetwork(NetworkModel.fromEntity(network)));
  }

  @override
  Future<Either<AppException, NetworkEntity?>> getNetwork(String id) async {
    return ErrorHandler.execute(() => _localDataSource.getNetwork(id));
  }

  @override
  Future<Either<AppException, List<NetworkEntity>>> getNetworksForUser(String userId) async {
    return ErrorHandler.execute(() => _localDataSource.getNetworksForUser(userId));
  }

  @override
  Future<Either<AppException, void>> saveRouter(RouterEntity router) async {
    return ErrorHandler.execute(() => _localDataSource.saveRouter(RouterModel.fromEntity(router)));
  }

  @override
  Future<Either<AppException, RouterEntity?>> getRouter(String networkId) async {
    return ErrorHandler.execute(() => _localDataSource.getRouter(networkId));
  }
}
