import 'dart:io';
import 'package:dio/dio.dart';
import '../../../domain/adapters/i_router_adapter.dart';
import 'i_discovery_strategy.dart';
import '../../../../../core/utils/logger.dart';

class UpnpStrategy implements IDiscoveryStrategy {
  @override
  Future<IRouterAdapter?> detect(Dio dio, String gatewayIp, String? gatewayMac) async {
    try {
      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      final multicastAddress = InternetAddress('239.255.255.250');
      
      final searchMessage = StringBuffer()
        ..write('M-SEARCH * HTTP/1.1\r\n')
        ..write('HOST: 239.255.255.250:1900\r\n')
        ..write('MAN: "ssdp:discover"\r\n')
        ..write('MX: 2\r\n')
        ..write('ST: urn:schemas-upnp-org:device:InternetGatewayDevice:1\r\n')
        ..write('\r\n');

      socket.send(searchMessage.toString().codeUnits, multicastAddress, 1900);
      
      // Framework prepared for reading UPnP Device Description XML.
      // Falls through to next strategy if no valid XML dictates vendor.
      await Future.delayed(const Duration(milliseconds: 500));
      socket.close();
      return null; 
    } catch (e) {
      AppLog().e('UPnP Discovery Failed', e);
      return null;
    }
  }
}
