import '../../../devices/domain/entities/device_entity.dart';

class UsageSummaryEntity {
  final double totalDownloadBytes;
  final double totalUploadBytes;
  final List<DeviceUsageEntity> topConsumers;
  final double projectedMonthlyBytes;

  const UsageSummaryEntity({
    required this.totalDownloadBytes,
    required this.totalUploadBytes,
    required this.topConsumers,
    required this.projectedMonthlyBytes,
  });
}

class DeviceUsageEntity {
  final DeviceEntity device;
  final double downloadBytes;
  final double uploadBytes;

  const DeviceUsageEntity({
    required this.device,
    required this.downloadBytes,
    required this.uploadBytes,
  });

  double get totalBytes => downloadBytes + uploadBytes;
}
