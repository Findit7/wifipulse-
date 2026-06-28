import 'package:dio/dio.dart';
import '../../../domain/adapters/i_router_adapter.dart';
import '../../adapters/airtel_router_adapter.dart';
import '../../adapters/jio_router_adapter.dart';
import 'i_discovery_strategy.dart';

class MacOuiStrategy implements IDiscoveryStrategy {
  @override
  Future<IRouterAdapter?> detect(Dio dio, String gatewayIp, String? gatewayMac) async {
    if (gatewayMac == null) return null;
    
    final prefix = gatewayMac.toUpperCase().replaceAll(':', '').substring(0, 6);
    if (prefix == 'CC3D82' || prefix == '001A11') { 
      return JioRouterAdapter(dio, gatewayIp);
    }
    if (prefix == 'FCFC48' || prefix == 'B827EB') { 
      return AirtelRouterAdapter(dio, gatewayIp);
    }
    return null;
  }
}
