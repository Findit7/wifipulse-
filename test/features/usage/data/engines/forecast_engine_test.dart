import 'package:flutter_test/flutter_test.dart';
import 'package:wifi_pulse/features/usage/data/engines/forecast_engine.dart';
import 'package:wifi_pulse/features/usage/domain/entities/usage_entity.dart';

void main() {
  late ForecastEngine engine;

  setUp(() {
    engine = ForecastEngine();
  });

  test('generateForecast with empty list returns zeroes', () {
    final forecast = engine.generateForecast([]);

    expect(forecast.predictedTodayBytes, equals(0));
    expect(forecast.predictedTomorrowBytes, equals(0));
    expect(forecast.predictedMonthlyBytes, equals(0));
    expect(forecast.predictedPeakHours, isEmpty);
  });

  test('generateForecast predicts peak hours and simple values', () {
    final now = DateTime.now();
    
    // Simulate usage exactly 1 day ago and today
    final entries = [
      UsageEntity(
        id: '1',
        deviceId: 'dev1',
        uploadBytes: 1000,
        downloadBytes: 9000, // 10000 total
        recordedAt: now.subtract(const Duration(days: 1)),
      ),
      UsageEntity(
        id: '2',
        deviceId: 'dev2',
        uploadBytes: 1000,
        downloadBytes: 4000, // 5000 total today
        recordedAt: DateTime(now.year, now.month, now.day, 12, 0), // noon today
      ),
    ];

    final forecast = engine.generateForecast(entries);
    
    // 7 day average relies on count=1, total=10000 -> predictedTomorrow = 10000
    expect(forecast.predictedTomorrowBytes, equals(10000));
    
    // Monthly relies on averageDaily (10000) * 30 = 300000
    expect(forecast.predictedMonthlyBytes, equals(300000));
    
    // Peak hours should include the hour of the past usage and today
    expect(forecast.predictedPeakHours, isNotEmpty);
  });
}
