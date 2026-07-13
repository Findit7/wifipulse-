import 'package:equatable/equatable.dart';

class UsageEntity extends Equatable {
  final String id;
  final String deviceId;
  final int uploadBytes;
  final int downloadBytes;
  final DateTime recordedAt;
  final int sessionDuration;
  final int foregroundUsage;
  final int wifiConnectionDuration;

  const UsageEntity({
    required this.id,
    required this.deviceId,
    required this.uploadBytes,
    required this.downloadBytes,
    required this.recordedAt,
    this.sessionDuration = 0,
    this.foregroundUsage = 0,
    this.wifiConnectionDuration = 0,
  });

  int get totalBytes => uploadBytes + downloadBytes;

  @override
  List<Object?> get props => [
        id,
        deviceId,
        uploadBytes,
        downloadBytes,
        recordedAt,
        sessionDuration,
        foregroundUsage,
        wifiConnectionDuration,
      ];
}
