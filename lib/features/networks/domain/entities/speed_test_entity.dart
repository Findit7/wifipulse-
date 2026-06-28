class SpeedTestEntity {
  final String id;
  final String networkId;
  final double downloadSpeedMbps;
  final double uploadSpeedMbps;
  final double pingMs;
  final DateTime timestamp;

  const SpeedTestEntity({
    required this.id,
    required this.networkId,
    required this.downloadSpeedMbps,
    required this.uploadSpeedMbps,
    required this.pingMs,
    required this.timestamp,
  });
}
