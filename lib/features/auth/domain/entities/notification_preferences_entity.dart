class NotificationPreferencesEntity {
  final String id;
  final String userId;
  final bool alertNewDevice;
  final bool alertSpeedDrop;
  final bool alertUsageSpike;
  final bool alertSecurity;
  final bool marketingNotifications;
  final DateTime updatedAt;

  const NotificationPreferencesEntity({
    required this.id,
    required this.userId,
    required this.alertNewDevice,
    required this.alertSpeedDrop,
    required this.alertUsageSpike,
    required this.alertSecurity,
    required this.marketingNotifications,
    required this.updatedAt,
  });
}
