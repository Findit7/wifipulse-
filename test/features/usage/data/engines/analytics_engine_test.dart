import 'package:flutter_test/flutter_test.dart';
import 'package:wifi_pulse/features/usage/data/engines/analytics_engine.dart';
import 'package:wifi_pulse/features/usage/domain/entities/usage_entity.dart';

void main() {
  late AnalyticsEngine engine;

  setUp(() {
    engine = AnalyticsEngine();
  });

  final now = DateTime.now();

  final mockEntries = [
    UsageEntity(
      id: '1',
      deviceId: 'dev1',
      uploadBytes: 1000,
      downloadBytes: 2000,
      recordedAt: DateTime(now.year, now.month, now.day, 10, 0), // 10 AM
      sessionDuration: 10000,
    ),
    UsageEntity(
      id: '2',
      deviceId: 'dev2',
      uploadBytes: 500,
      downloadBytes: 1000,
      recordedAt: DateTime(now.year, now.month, now.day, 10, 30), // 10 AM
      sessionDuration: 5000,
    ),
    UsageEntity(
      id: '3',
      deviceId: 'dev1',
      uploadBytes: 2000,
      downloadBytes: 4000,
      recordedAt: DateTime(now.year, now.month, now.day, 20, 0), // 8 PM
      sessionDuration: 20000,
    ),
  ];

  test('calculateSummary computes totals correctly', () {
    final summary = engine.calculateSummary(mockEntries);

    expect(summary.totalUploadBytes, equals(3500));
    expect(summary.totalDownloadBytes, equals(7000));
    expect(summary.totalBytes, equals(10500));
    expect(summary.activeDevices, equals(2)); // dev1 and dev2
    expect(summary.peakUsageHour, equals(20)); // 8 PM has 6000 bytes, 10 AM has 4500
  });

  test('calculateTopDevices sorts by total usage', () {
    final topDevices = engine.calculateTopDevices(mockEntries);

    expect(topDevices.length, equals(2));
    expect(topDevices.first.deviceId, equals('dev1')); // 3000 + 6000 = 9000
    expect(topDevices.first.totalBytes, equals(9000));
    expect(topDevices.last.deviceId, equals('dev2')); // 1500
    expect(topDevices.last.totalBytes, equals(1500));
  });

  test('calculateDailyTrends aggregates correctly', () {
    final daily = engine.calculateDailyTrends(mockEntries, days: 1);
    
    // There should be one entry for today
    expect(daily.isNotEmpty, isTrue);
    final today = daily.last;
    expect(today.uploadBytes, equals(3500));
    expect(today.downloadBytes, equals(7000));
  });
}
