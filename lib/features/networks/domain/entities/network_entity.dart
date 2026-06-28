class NetworkEntity {
  final String id;
  final String userId;
  final String ssid;
  final String bssid;
  final DateTime createdAt;

  const NetworkEntity({
    required this.id,
    required this.userId,
    required this.ssid,
    required this.bssid,
    required this.createdAt,
  });
}
