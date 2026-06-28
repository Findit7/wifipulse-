class UsageHistoryEntity {
  final String id;
  final String networkId;
  final double bytesDownloaded;
  final double bytesUploaded;
  final DateTime timestamp;

  const UsageHistoryEntity({
    required this.id,
    required this.networkId,
    required this.bytesDownloaded,
    required this.bytesUploaded,
    required this.timestamp,
  });
}
