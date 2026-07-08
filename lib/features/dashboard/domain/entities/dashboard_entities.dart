class NetworkSummary {
  final String? ssid;
  final String? bssid;
  final String? gatewayIp;
  final String? localIp;
  final bool isOnline;
  final int signalStrength;

  const NetworkSummary({
    this.ssid,
    this.bssid,
    this.gatewayIp,
    this.localIp,
    this.isOnline = false,
    this.signalStrength = 0,
  });
}

class DashboardStatistics {
  final int connectedDevices;
  final double downloadSpeedMbps;
  final double uploadSpeedMbps;
  final double pingMs;
  final int healthScore; // 0-100
  final int securityScore; // 0-100
  final String aiStatus;

  const DashboardStatistics({
    this.connectedDevices = 0,
    this.downloadSpeedMbps = 0.0,
    this.uploadSpeedMbps = 0.0,
    this.pingMs = 0.0,
    this.healthScore = 0,
    this.securityScore = 0,
    this.aiStatus = 'Analyzing',
  });
}

class DashboardStatus {
  final NetworkSummary network;
  final DashboardStatistics stats;
  final List<String> recentActivity;

  const DashboardStatus({
    required this.network,
    required this.stats,
    this.recentActivity = const [],
  });
}
