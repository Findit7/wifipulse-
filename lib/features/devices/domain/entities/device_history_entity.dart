class DeviceHistoryEntity {
  final String id;
  final String deviceId;
  final String eventType;
  final DateTime timestamp;

  const DeviceHistoryEntity({
    required this.id,
    required this.deviceId,
    required this.eventType,
    required this.timestamp,
  });
}
