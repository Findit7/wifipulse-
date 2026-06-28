import 'package:dio/dio.dart';
import '../../../domain/adapters/i_router_adapter.dart';

abstract class IDiscoveryStrategy {
  Future<IRouterAdapter?> detect(Dio dio, String gatewayIp, String? gatewayMac);
}
