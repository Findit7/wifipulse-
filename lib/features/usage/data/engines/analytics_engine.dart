import 'package:wifi_pulse/features/usage/domain/entities/usage_entity.dart';
import 'package:wifi_pulse/features/usage/domain/entities/usage_aggregates.dart';
import 'package:collection/collection.dart';

class AnalyticsEngine {
  UsageSummary calculateSummary(List<UsageEntity> entries) {
    int totalUpload = 0;
    int totalDownload = 0;
    final deviceSet = <String>{};
    final hourUsage = List.filled(24, 0);

    for (final entry in entries) {
      totalUpload += entry.uploadBytes;
      totalDownload += entry.downloadBytes;
      deviceSet.add(entry.deviceId);
      hourUsage[entry.recordedAt.hour] += entry.totalBytes;
    }

    int peakHour = 0;
    int maxUsage = 0;
    for (int i = 0; i < 24; i++) {
      if (hourUsage[i] > maxUsage) {
        maxUsage = hourUsage[i];
        peakHour = i;
      }
    }

    // Mock bandwidth calculation based on session durations
    final totalDurationMs = entries.fold<int>(0, (sum, entry) => sum + entry.sessionDuration);
    double avgBandwidth = 0.0;
    if (totalDurationMs > 0) {
      // (Total bytes * 8) / (Total seconds) -> bits per second -> Mbps
      final totalBits = (totalUpload + totalDownload) * 8;
      final totalSeconds = totalDurationMs / 1000;
      avgBandwidth = (totalBits / totalSeconds) / 1000000;
    }

    // Mock utilization based on an arbitrary max capacity (e.g. 1000 Mbps)
    final utilization = (avgBandwidth / 1000) * 100;

    return UsageSummary(
      totalUploadBytes: totalUpload,
      totalDownloadBytes: totalDownload,
      peakUsageHour: peakHour,
      activeDevices: deviceSet.length,
      averageBandwidthMbps: avgBandwidth,
      networkUtilizationPercent: utilization.clamp(0.0, 100.0),
    );
  }

  List<TopDevice> calculateTopDevices(List<UsageEntity> entries, {int limit = 5}) {
    final deviceUsageMap = <String, int>{};
    
    for (final entry in entries) {
      deviceUsageMap[entry.deviceId] = (deviceUsageMap[entry.deviceId] ?? 0) + entry.totalBytes;
    }

    final topDevices = deviceUsageMap.entries.map((e) {
      return TopDevice(
        deviceId: e.key,
        deviceName: 'Device ${e.key.substring(0, 4)}', // Ideally joined with Device table
        totalBytes: e.value,
      );
    }).toList();

    topDevices.sort((a, b) => b.totalBytes.compareTo(a.totalBytes));
    return topDevices.take(limit).toList();
  }

  List<DailyUsage> calculateDailyTrends(List<UsageEntity> entries, {int days = 7}) {
    final Map<DateTime, DailyUsage> dailyMap = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Initialize map with empty usage for the last 'days' days
    for (int i = 0; i < days; i++) {
      final date = today.subtract(Duration(days: i));
      dailyMap[date] = DailyUsage(date: date, uploadBytes: 0, downloadBytes: 0);
    }

    for (final entry in entries) {
      final entryDate = DateTime(entry.recordedAt.year, entry.recordedAt.month, entry.recordedAt.day);
      if (dailyMap.containsKey(entryDate)) {
        final current = dailyMap[entryDate]!;
        dailyMap[entryDate] = DailyUsage(
          date: entryDate,
          uploadBytes: current.uploadBytes + entry.uploadBytes,
          downloadBytes: current.downloadBytes + entry.downloadBytes,
        );
      }
    }

    final result = dailyMap.values.toList();
    result.sort((a, b) => a.date.compareTo(b.date));
    return result;
  }

  List<WeeklyUsage> calculateWeeklyTrends(List<UsageEntity> entries, {int weeks = 4}) {
    final Map<DateTime, WeeklyUsage> weeklyMap = {};
    final now = DateTime.now();
    
    // Normalize to the start of the week (Monday)
    final thisWeekStart = DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1));

    for (int i = 0; i < weeks; i++) {
      final date = thisWeekStart.subtract(Duration(days: i * 7));
      weeklyMap[date] = WeeklyUsage(weekStartDate: date, uploadBytes: 0, downloadBytes: 0);
    }

    for (final entry in entries) {
      final entryDate = DateTime(entry.recordedAt.year, entry.recordedAt.month, entry.recordedAt.day);
      final entryWeekStart = entryDate.subtract(Duration(days: entryDate.weekday - 1));
      
      if (weeklyMap.containsKey(entryWeekStart)) {
        final current = weeklyMap[entryWeekStart]!;
        weeklyMap[entryWeekStart] = WeeklyUsage(
          weekStartDate: entryWeekStart,
          uploadBytes: current.uploadBytes + entry.uploadBytes,
          downloadBytes: current.downloadBytes + entry.downloadBytes,
        );
      }
    }

    final result = weeklyMap.values.toList();
    result.sort((a, b) => a.weekStartDate.compareTo(b.weekStartDate));
    return result;
  }

  List<MonthlyUsage> calculateMonthlyTrends(List<UsageEntity> entries, {int months = 12}) {
    final Map<DateTime, MonthlyUsage> monthlyMap = {};
    final now = DateTime.now();
    
    for (int i = 0; i < months; i++) {
      final date = DateTime(now.year, now.month - i, 1);
      monthlyMap[date] = MonthlyUsage(month: date, uploadBytes: 0, downloadBytes: 0);
    }

    for (final entry in entries) {
      final entryMonth = DateTime(entry.recordedAt.year, entry.recordedAt.month, 1);
      
      if (monthlyMap.containsKey(entryMonth)) {
        final current = monthlyMap[entryMonth]!;
        monthlyMap[entryMonth] = MonthlyUsage(
          month: entryMonth,
          uploadBytes: current.uploadBytes + entry.uploadBytes,
          downloadBytes: current.downloadBytes + entry.downloadBytes,
        );
      }
    }

    final result = monthlyMap.values.toList();
    result.sort((a, b) => a.month.compareTo(b.month));
    return result;
  }
}
