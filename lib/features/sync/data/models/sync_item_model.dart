import '../../domain/entities/sync_item_entity.dart';

class SyncItemModel extends SyncItemEntity {
  const SyncItemModel({
    super.id,
    required super.entityType,
    required super.entityId,
    required super.action,
    required super.payload,
    required super.status,
    required super.retryCount,
    required super.createdAt,
  });

  factory SyncItemModel.fromMap(Map<String, dynamic> map) {
    return SyncItemModel(
      id: map['id'] as int?,
      entityType: map['entity_type'] as String,
      entityId: map['entity_id'] as String,
      action: map['action'] as String,
      payload: map['payload'] as String,
      status: map['status'] as String,
      retryCount: map['retry_count'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'entity_type': entityType,
      'entity_id': entityId,
      'action': action,
      'payload': payload,
      'status': status,
      'retry_count': retryCount,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory SyncItemModel.fromEntity(SyncItemEntity entity) {
    return SyncItemModel(
      id: entity.id,
      entityType: entity.entityType,
      entityId: entity.entityId,
      action: entity.action,
      payload: entity.payload,
      status: entity.status,
      retryCount: entity.retryCount,
      createdAt: entity.createdAt,
    );
  }
}
