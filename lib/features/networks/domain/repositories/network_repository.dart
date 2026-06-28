import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/network_entity.dart';
import '../entities/router_entity.dart';

abstract class NetworkRepository {
  Future<Either<AppException, void>> saveNetwork(NetworkEntity network);
  Future<Either<AppException, NetworkEntity?>> getNetwork(String id);
  Future<Either<AppException, List<NetworkEntity>>> getNetworksForUser(String userId);
  Future<Either<AppException, void>> saveRouter(RouterEntity router);
  Future<Either<AppException, RouterEntity?>> getRouter(String networkId);
}
