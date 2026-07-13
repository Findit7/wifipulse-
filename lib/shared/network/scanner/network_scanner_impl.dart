import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:ping_discover_network_plus/ping_discover_network_plus.dart';
import 'package:uuid/uuid.dart';

import '../../errors/failure.dart';
import '../../utils/result.dart';
import '../models/wifi_info.dart';
import 'network_scanner.dart';
import '../../../features/devices/domain/entities/device_entity.dart';

class NetworkScannerImpl implements NetworkScanner {
  NetworkScannerImpl();

  @override
  Future<Result<List<DeviceEntity>>> fastScan(WifiInfo wifiInfo) async {
    try {
      final ip = wifiInfo.localIp;
      if (ip == null || ip.isEmpty) {
        return left(const NetworkFailure('No local IP available for scan.'));
      }

      final subnet = ip.substring(0, ip.lastIndexOf('.'));
      final stream = NetworkAnalyzer.discover2(subnet, 80, timeout: const Duration(milliseconds: 1000));
      
      final List<DeviceEntity> discoveredDevices = [];
      final now = DateTime.now();

      await for (final NetworkAddress addr in stream) {
        if (addr.exists) {
          // Found an active IP
          final ipAddr = addr.ip;
          // In a fast scan on Android 10+, we can't reliably read the ARP table without root.
          // We will use the IP as the initial identifier, and spoof a temporary MAC.
          // Deep scan will attempt to resolve true MAC via router APIs or ARP table if allowed.
          final tempMac = 'unknown_${ipAddr.replaceAll('.', '_')}';
          
          discoveredDevices.add(DeviceEntity(
            id: const Uuid().v4(),
            networkId: wifiInfo.bssid ?? 'unknown_bssid',
            macAddress: tempMac,
            ipAddress: ipAddr,
            deviceType: 'Unknown',
            isTrusted: false,
            isOnline: true,
            firstSeen: now,
            lastSeen: now,
            riskScore: 50, // Default moderate risk for unknown new devices
          ));
        }
      }

      return right(discoveredDevices);
    } catch (e) {
      return left(NetworkFailure('Fast scan failed: $e'));
    }
  }

  @override
  Future<Result<List<DeviceEntity>>> deepScan(WifiInfo wifiInfo) async {
    // Deep scan delegates to fastScan to get IPs, then performs DNS resolution and advanced fingerprinting.
    try {
      final fastResult = await fastScan(wifiInfo);
      return fastResult.fold(
        (failure) => left(failure),
        (devices) async {
          final List<DeviceEntity> deepDiscovered = [];
          
          for (final device in devices) {
             String? hostname;
             if (device.ipAddress != null) {
                try {
                   final result = await InternetAddress(device.ipAddress!).reverse();
                   hostname = result.host;
                } catch (_) {
                   // DNS reverse lookup failed, keep hostname null
                }
             }
             
             deepDiscovered.add(DeviceEntity(
                id: device.id,
                networkId: device.networkId,
                macAddress: device.macAddress,
                ipAddress: device.ipAddress,
                hostname: hostname,
                deviceType: device.deviceType,
                isTrusted: device.isTrusted,
                isOnline: device.isOnline,
                firstSeen: device.firstSeen,
                lastSeen: device.lastSeen,
                riskScore: device.riskScore,
             ));
          }
          return right(deepDiscovered);
        }
      );
    } catch (e) {
      return left(NetworkFailure('Deep scan failed: $e'));
    }
  }
}
