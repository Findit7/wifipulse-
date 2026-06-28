import '../../domain/entities/device_history_entity.dart';

class DeviceHistoryModel extends DeviceHistoryEntity {
  const DeviceHistoryModel({
    required super.id,
    required super.deviceId,
    required super.eventType,
    required super.timestamp,
  });

  factory DeviceHistoryModel.fromMap(Map<String, dynamic> map) {
    return DeviceHistoryModel(
      id: map['id'] as String,
      deviceId: map['device_id'] as String,
      eventType: map['event_type'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'device_id': deviceId,
      'event_type': eventType,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory DeviceHistoryModel.fromEntity(DeviceHistoryEntity entity) {
    return DeviceHistoryModel(
      id: entity.id,
      deviceId: entity.deviceId,
      eventType: entity.eventType,
      timestamp: entity.timestamp,
    );
  }
}
