import 'package:dio/dio.dart';
import '../../../domain/adapters/i_router_adapter.dart';
import '../../adapters/airtel_router_adapter.dart';
import '../../adapters/jio_router_adapter.dart';
import 'i_discovery_strategy.dart';

class HttpFingerprintStrategy implements IDiscoveryStrategy {
  @override
  Future<IRouterAdapter?> detect(Dio dio, String gatewayIp, String? gatewayMac) async {
    try {
      final response = await dio.get('http://$gatewayIp', options: Options(
        validateStatus: (status) => status != null && status < 500,
        receiveTimeout: const Duration(seconds: 3),
      ));
      
      final body = response.data.toString().toLowerCase();
      if (body.contains('jio') || body.contains('jcow')) {
        return JioRouterAdapter(dio, gatewayIp);
      }
      if (body.contains('airtel') || body.contains('nokia')) {
        return AirtelRouterAdapter(dio, gatewayIp);
      }
    } catch (_) {
      // Ignored: Timeouts handled gracefully
    }
    return null;
  }
}
