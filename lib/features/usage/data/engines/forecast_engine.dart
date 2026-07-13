import 'package:wifi_pulse/features/usage/domain/entities/usage_entity.dart';
import 'package:wifi_pulse/features/usage/domain/entities/usage_aggregates.dart';

class ForecastEngine {
  UsageForecast generateForecast(List<UsageEntity> entries) {
    if (entries.isEmpty) {
      return const UsageForecast(
        predictedTodayBytes: 0,
        predictedTomorrowBytes: 0,
        predictedMonthlyBytes: 0,
        predictedPeakHours: [],
      );
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Group by day to calculate simple moving average
    final Map<DateTime, int> dailyTotals = {};
    for (final entry in entries) {
      final entryDate = DateTime(entry.recordedAt.year, entry.recordedAt.month, entry.recordedAt.day);
      dailyTotals[entryDate] = (dailyTotals[entryDate] ?? 0) + entry.totalBytes;
    }

    // Sort days
    final sortedDays = dailyTotals.keys.toList()..sort();
    
    int todayBytes = dailyTotals[today] ?? 0;
    
    // Calculate 7-day moving average for tomorrow's prediction
    int past7DaysTotal = 0;
    int count = 0;
    for (int i = 1; i <= 7; i++) {
      final d = today.subtract(Duration(days: i));
      if (dailyTotals.containsKey(d)) {
        past7DaysTotal += dailyTotals[d]!;
        count++;
      }
    }
    
    final int predictedTomorrow = count > 0 ? (past7DaysTotal / count).round() : todayBytes;
    
    // Predict today's total by extrapolating current usage based on time of day
    int predictedToday = todayBytes;
    if (now.hour > 0 && now.hour < 23) {
      final currentPercentageOfDay = now.hour / 24.0;
      predictedToday = (todayBytes / currentPercentageOfDay).round();
    } else if (now.hour == 0) {
      predictedToday = predictedTomorrow;
    }

    // Predict monthly bytes by multiplying the average daily by 30
    final int averageDaily = count > 0 ? (past7DaysTotal / count).round() : predictedToday;
    final int predictedMonthly = averageDaily * 30;

    // Predict peak hours by analyzing all entries
    final hourUsage = List.filled(24, 0);
    for (final entry in entries) {
      hourUsage[entry.recordedAt.hour] += entry.totalBytes;
    }

    // Find top 3 hours
    final List<MapEntry<int, int>> hourEntries = hourUsage.asMap().entries.toList();
    hourEntries.sort((a, b) => b.value.compareTo(a.value));
    
    final List<int> predictedPeakHours = hourEntries.take(3).where((e) => e.value > 0).map((e) => e.key).toList();

    return UsageForecast(
      predictedTodayBytes: predictedToday,
      predictedTomorrowBytes: predictedTomorrow,
      predictedMonthlyBytes: predictedMonthly,
      predictedPeakHours: predictedPeakHours,
    );
  }
}
