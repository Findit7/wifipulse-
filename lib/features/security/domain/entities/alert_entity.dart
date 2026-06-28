class AlertEntity {
  final String id;
  final String networkId;
  final String type; 
  final String title;
  final String message;
  final bool isRead;
  final DateTime createdAt;

  const AlertEntity({
    required this.id,
    required this.networkId,
    required this.type,
    required this.title,
    required this.message,
    required this.createdAt,
    this.isRead = false,
  });

  AlertEntity copyWith({
    String? id,
    String? networkId,
    String? type,
    String? title,
    String? message,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return AlertEntity(
      id: id ?? this.id,
      networkId: networkId ?? this.networkId,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
