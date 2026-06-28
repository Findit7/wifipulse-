import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'connectivity_service.dart';

class ConnectivityServiceImpl implements IConnectivityService {
  final Connectivity _connectivity;
  final NetworkInfo _networkInfo;

  ConnectivityServiceImpl(this._connectivity, this._networkInfo);

  @override
  Stream<bool> get isConnectedStream {
    return _connectivity.onConnectivityChanged.map((ConnectivityResult result) {
      return result == ConnectivityResult.wifi || result == ConnectivityResult.mobile;
    });
  }

  @override
  Future<bool> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi || result == ConnectivityResult.mobile;
  }

  @override
  Future<bool> isWifiConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi;
  }

  @override
  Future<bool> isMobileDataConnected() async {
    final result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile;
  }

  @override
  Future<bool> hasInternetReachability() async {
    if (!await checkConnectivity()) return false;
    // In production, implement active ping to 8.8.8.8
    return true; 
  }

  @override
  Future<bool> isSyncAvailable() async {
    return await hasInternetReachability();
  }
}
