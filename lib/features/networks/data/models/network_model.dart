import '../../domain/entities/network_entity.dart';

class NetworkModel extends NetworkEntity {
  const NetworkModel({
    required super.id,
    required super.userId,
    required super.ssid,
    required super.bssid,
    required super.createdAt,
  });

  factory NetworkModel.fromMap(Map<String, dynamic> map) {
    return NetworkModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      ssid: map['ssid'] as String,
      bssid: map['bssid'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'ssid': ssid,
      'bssid': bssid,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory NetworkModel.fromEntity(NetworkEntity entity) {
    return NetworkModel(
      id: entity.id,
      userId: entity.userId,
      ssid: entity.ssid,
      bssid: entity.bssid,
      createdAt: entity.createdAt,
    );
  }
}
