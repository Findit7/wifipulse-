class SyncItemEntity {
  final int? id;
  final String entityType; // e.g., 'Device', 'Network'
  final String entityId;
  final String action; // 'CREATE', 'UPDATE', 'DELETE'
  final String payload;
  final String status; // 'PENDING', 'PROCESSING', 'FAILED', 'COMPLETED'
  final int retryCount;
  final DateTime createdAt;

  const SyncItemEntity({
    this.id,
    required this.entityType,
    required this.entityId,
    required this.action,
    required this.payload,
    required this.status,
    required this.retryCount,
    required this.createdAt,
  });

  SyncItemEntity copyWith({
    int? id,
    String? entityType,
    String? entityId,
    String? action,
    String? payload,
    String? status,
    int? retryCount,
    DateTime? createdAt,
  }) {
    return SyncItemEntity(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
