import '../../domain/entities/usage_history_entity.dart';

class UsageHistoryModel extends UsageHistoryEntity {
  const UsageHistoryModel({
    required super.id,
    required super.networkId,
    required super.bytesDownloaded,
    required super.bytesUploaded,
    required super.timestamp,
  });

  factory UsageHistoryModel.fromMap(Map<String, dynamic> map) {
    return UsageHistoryModel(
      id: map['id'] as String,
      networkId: map['network_id'] as String,
      bytesDownloaded: map['bytes_downloaded'] as double,
      bytesUploaded: map['bytes_uploaded'] as double,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'network_id': networkId,
      'bytes_downloaded': bytesDownloaded,
      'bytes_uploaded': bytesUploaded,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory UsageHistoryModel.fromEntity(UsageHistoryEntity entity) {
    return UsageHistoryModel(
      id: entity.id,
      networkId: entity.networkId,
      bytesDownloaded: entity.bytesDownloaded,
      bytesUploaded: entity.bytesUploaded,
      timestamp: entity.timestamp,
    );
  }
}
