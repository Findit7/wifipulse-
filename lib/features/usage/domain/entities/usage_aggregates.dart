import 'package:equatable/equatable.dart';

class UsageSummary extends Equatable {
  final int totalUploadBytes;
  final int totalDownloadBytes;
  final int peakUsageHour; // 0-23
  final int activeDevices;
  final double averageBandwidthMbps;
  final double networkUtilizationPercent;

  const UsageSummary({
    required this.totalUploadBytes,
    required this.totalDownloadBytes,
    required this.peakUsageHour,
    required this.activeDevices,
    required this.averageBandwidthMbps,
    required this.networkUtilizationPercent,
  });

  int get totalBytes => totalUploadBytes + totalDownloadBytes;

  @override
  List<Object?> get props => [
        totalUploadBytes,
        totalDownloadBytes,
        peakUsageHour,
        activeDevices,
        averageBandwidthMbps,
        networkUtilizationPercent,
      ];
}

class TopDevice extends Equatable {
  final String deviceId;
  final String deviceName;
  final int totalBytes;

  const TopDevice({
    required this.deviceId,
    required this.deviceName,
    required this.totalBytes,
  });

  @override
  List<Object?> get props => [deviceId, deviceName, totalBytes];
}

class DailyUsage extends Equatable {
  final DateTime date;
  final int uploadBytes;
  final int downloadBytes;

  const DailyUsage({
    required this.date,
    required this.uploadBytes,
    required this.downloadBytes,
  });
  
  int get totalBytes => uploadBytes + downloadBytes;

  @override
  List<Object?> get props => [date, uploadBytes, downloadBytes];
}

class WeeklyUsage extends Equatable {
  final DateTime weekStartDate;
  final int uploadBytes;
  final int downloadBytes;

  const WeeklyUsage({
    required this.weekStartDate,
    required this.uploadBytes,
    required this.downloadBytes,
  });
  
  int get totalBytes => uploadBytes + downloadBytes;

  @override
  List<Object?> get props => [weekStartDate, uploadBytes, downloadBytes];
}

class MonthlyUsage extends Equatable {
  final DateTime month;
  final int uploadBytes;
  final int downloadBytes;

  const MonthlyUsage({
    required this.month,
    required this.uploadBytes,
    required this.downloadBytes,
  });
  
  int get totalBytes => uploadBytes + downloadBytes;

  @override
  List<Object?> get props => [month, uploadBytes, downloadBytes];
}

class UsageForecast extends Equatable {
  final int predictedTodayBytes;
  final int predictedTomorrowBytes;
  final int predictedMonthlyBytes;
  final List<int> predictedPeakHours; // 0-23

  const UsageForecast({
    required this.predictedTodayBytes,
    required this.predictedTomorrowBytes,
    required this.predictedMonthlyBytes,
    required this.predictedPeakHours,
  });

  @override
  List<Object?> get props => [
        predictedTodayBytes,
        predictedTomorrowBytes,
        predictedMonthlyBytes,
        predictedPeakHours,
      ];
}
