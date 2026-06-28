class UsageEntity {
  final String id;
  final String networkId;
  final String? deviceId;
  final double bytesDownloaded;
  final double bytesUploaded;
  final DateTime timestamp;

  const UsageEntity({
    required this.id,
    required this.networkId,
    this.deviceId,
    required this.bytesDownloaded,
    required this.bytesUploaded,
    required this.timestamp,
  });
}
