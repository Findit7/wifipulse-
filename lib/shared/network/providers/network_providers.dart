import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers/global_providers.dart';
import '../connectivity/connectivity_service.dart';
import '../connectivity/wifi_info_service.dart';
import '../utils/permission_manager.dart';
import '../scanner/network_scanner.dart';
import '../scanner/network_scanner_impl.dart';

part 'network_providers.g.dart';

@Riverpod(keepAlive: true)
Connectivity connectivity(ConnectivityRef ref) {
  return Connectivity();
}

@Riverpod(keepAlive: true)
NetworkInfo networkInfo(NetworkInfoRef ref) {
  return NetworkInfo();
}

@Riverpod(keepAlive: true)
ConnectivityService connectivityService(ConnectivityServiceRef ref) {
  return ConnectivityService(
    ref.watch(connectivityProvider),
    ref.watch(loggerServiceProvider),
  );
}

@Riverpod(keepAlive: true)
WifiInfoService wifiInfoService(WifiInfoServiceRef ref) {
  return WifiInfoService(
    ref.watch(networkInfoProvider),
    ref.watch(loggerServiceProvider),
  );
}

@Riverpod(keepAlive: true)
PermissionManager permissionManager(PermissionManagerRef ref) {
  return PermissionManager(
    ref.watch(loggerServiceProvider),
  );
}

@Riverpod(keepAlive: true)
NetworkScanner networkScanner(NetworkScannerRef ref) {
  return NetworkScannerImpl();
}
