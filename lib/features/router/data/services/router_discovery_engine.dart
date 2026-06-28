import 'package:dio/dio.dart';
import '../../domain/adapters/i_router_adapter.dart';
import '../adapters/airtel_router_adapter.dart';
import '../adapters/jio_router_adapter.dart';
import '../adapters/generic_router_adapter.dart';
import 'strategies/i_discovery_strategy.dart';
import 'strategies/mac_oui_strategy.dart';
import 'strategies/upnp_strategy.dart';
import 'strategies/http_fingerprint_strategy.dart';

enum ManualRouterSelection {
  airtel,
  jio,
  generic
}

class RouterDiscoveryEngine {
  final Dio _dio;
  final List<IDiscoveryStrategy> _strategies;

  RouterDiscoveryEngine(this._dio) : _strategies = [
    MacOuiStrategy(),
    UpnpStrategy(), // Added UPnP Strategy here
    HttpFingerprintStrategy(),
  ];

  Future<IRouterAdapter> detectRouter(String gatewayIp, String? gatewayMac) async {
    for (final strategy in _strategies) {
      final adapter = await strategy.detect(_dio, gatewayIp, gatewayMac);
      if (adapter != null) {
        return adapter;
      }
    }
    
    // Automatic fallback
    return GenericRouterAdapter(_dio, gatewayIp);
  }

  IRouterAdapter getManualAdapter(ManualRouterSelection selection, String gatewayIp) {
    switch (selection) {
      case ManualRouterSelection.airtel:
        return AirtelRouterAdapter(_dio, gatewayIp);
      case ManualRouterSelection.jio:
        return JioRouterAdapter(_dio, gatewayIp);
      case ManualRouterSelection.generic:
        return GenericRouterAdapter(_dio, gatewayIp);
    }
  }
}
