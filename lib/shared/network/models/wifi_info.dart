/// Model representing detailed information about the current WiFi connection.
class WifiInfo {
  final String? ssid;
  final String? bssid;
  final String? gatewayIp;
  final String? localIp;
  final String connectionType;
  final int? signalStrength;

  const WifiInfo({
    this.ssid,
    this.bssid,
    this.gatewayIp,
    this.localIp,
    required this.connectionType,
    this.signalStrength,
  });

  @override
  String toString() {
    return 'WifiInfo(ssid: $ssid, bssid: $bssid, gatewayIp: $gatewayIp, localIp: $localIp, connectionType: $connectionType, signalStrength: $signalStrength)';
  }
}
