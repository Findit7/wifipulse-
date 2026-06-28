import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/repositories/usage_repository.dart';
import '../../domain/entities/usage_entity.dart';
import '../../domain/entities/usage_summary_entity.dart';
import '../../../networks/domain/entities/speed_test_entity.dart';
import '../../../devices/domain/repositories/device_repository.dart';

import '../../../../core/database/database_helper.dart';

class UsageRepositoryImpl implements UsageRepository {
  final DeviceRepository _deviceRepository;

  UsageRepositoryImpl(this._deviceRepository);

  @override
  Future<Either<AppException, List<UsageEntity>>> getUsageHistory(
      String networkId) async {
    return ErrorHandler.execute(() async {
      final db = await DatabaseHelper.init();
      final maps = await db.query(
        'UsageHistory',
        where: 'network_id = ?',
        whereArgs: [networkId],
        orderBy: 'timestamp DESC',
      );

      return maps
          .map((map) => UsageEntity(
                id: map['id'] as String,
                deviceId: map['device_id'] as String,
                networkId: map['network_id'] as String,
                bytesDownloaded: (map['download_bytes'] as int).toDouble(),
                bytesUploaded: (map['upload_bytes'] as int).toDouble(),
                timestamp: DateTime.parse(map['timestamp'] as String),
              ))
          .toList();
    });
  }

  @override
  Future<Either<AppException, List<SpeedTestEntity>>> getSpeedTests(
      String networkId) async {
    return ErrorHandler.execute(() async {
      return [];
    });
  }

  @override
  Future<Either<AppException, UsageSummaryEntity>> getDailySummary(
      String networkId) async {
    return _aggregate(networkId, const Duration(days: 1));
  }

  @override
  Future<Either<AppException, UsageSummaryEntity>> getWeeklySummary(
      String networkId) async {
    return _aggregate(networkId, const Duration(days: 7));
  }

  @override
  Future<Either<AppException, UsageSummaryEntity>> getMonthlySummary(
      String networkId) async {
    return _aggregate(networkId, const Duration(days: 30));
  }

  Future<Either<AppException, UsageSummaryEntity>> _aggregate(
      String networkId, Duration duration) async {
    return ErrorHandler.execute(() async {
      final cutoff = DateTime.now().subtract(duration);

      final db = await DatabaseHelper.init();
      final maps = await db.query(
        'UsageHistory',
        where: 'network_id = ? AND timestamp > ?',
        whereArgs: [networkId, cutoff.toIso8601String()],
      );

      final List<UsageEntity> logs = maps
          .map((map) => UsageEntity(
                id: map['id'] as String,
                deviceId: map['device_id'] as String,
                networkId: map['network_id'] as String,
                bytesDownloaded: (map['download_bytes'] as int).toDouble(),
                bytesUploaded: (map['upload_bytes'] as int).toDouble(),
                timestamp: DateTime.parse(map['timestamp'] as String),
              ))
          .toList();

      if (logs.isEmpty) {
        return const UsageSummaryEntity(
          totalDownloadBytes: 0,
          totalUploadBytes: 0,
          topConsumers: [],
          projectedMonthlyBytes: 0,
        );
      }

      double totalDown = 0;
      double totalUp = 0;
      final Map<String, double> deviceDownMap = {};
      final Map<String, double> deviceUpMap = {};

      for (var log in logs) {
        if (log.timestamp.isAfter(cutoff)) {
          totalDown += log.bytesDownloaded;
          totalUp += log.bytesUploaded;

          if (log.deviceId != null) {
            deviceDownMap[log.deviceId!] =
                (deviceDownMap[log.deviceId!] ?? 0) + log.bytesDownloaded;
            deviceUpMap[log.deviceId!] =
                (deviceUpMap[log.deviceId!] ?? 0) + log.bytesUploaded;
          }
        }
      }

      final List<DeviceUsageEntity> topConsumers = [];
      for (var deviceId in deviceDownMap.keys) {
        final deviceResult = await _deviceRepository.getDeviceById(deviceId);
        final device = deviceResult.toOption().toNullable();
        if (device != null) {
          topConsumers.add(DeviceUsageEntity(
            device: device,
            downloadBytes: deviceDownMap[deviceId] ?? 0,
            uploadBytes: deviceUpMap[deviceId] ?? 0,
          ));
        }
      }

      topConsumers.sort((a, b) => b.totalBytes.compareTo(a.totalBytes));

      double projected = 0;
      if (duration.inDays == 1) projected = totalDown * 30;
      if (duration.inDays == 7) projected = (totalDown / 7) * 30;
      if (duration.inDays >= 30) projected = totalDown;

      return UsageSummaryEntity(
        totalDownloadBytes: totalDown,
        totalUploadBytes: totalUp,
        topConsumers: topConsumers.take(5).toList(),
        projectedMonthlyBytes: projected,
      );
    });
  }
}
