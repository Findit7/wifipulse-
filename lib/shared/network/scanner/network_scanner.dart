import 'package:fpdart/fpdart.dart';
import '../../errors/failure.dart';
import '../../utils/result.dart';
import '../models/wifi_info.dart';
import '../../../features/devices/domain/entities/device_entity.dart';

/// Foundation interface for network scanning operations.
abstract class NetworkScanner {
  /// Performs a quick scan, typically using ARP requests on the local subnet.
  Future<Result<List<DeviceEntity>>> fastScan(WifiInfo wifiInfo);

  /// Performs a deep scan involving ping sweeps, mDNS discovery, and UPnP detection.
  Future<Result<List<DeviceEntity>>> deepScan(WifiInfo wifiInfo);
}
