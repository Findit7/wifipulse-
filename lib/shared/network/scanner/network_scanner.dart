import 'package:fpdart/fpdart.dart';
import '../../errors/failure.dart';
import '../../utils/result.dart';
import '../models/wifi_info.dart';
import '../../../database/tables/devices.dart'; // Depending on shared database models

/// Foundation interface for network scanning operations.
abstract class NetworkScanner {
  /// Performs a quick scan, typically using ARP requests on the local subnet.
  Future<Result<List<DeviceEntry>>> fastScan(WifiInfo wifiInfo);

  /// Performs a deep scan involving ping sweeps, mDNS discovery, and UPnP detection.
  Future<Result<List<DeviceEntry>>> deepScan(WifiInfo wifiInfo);
}
