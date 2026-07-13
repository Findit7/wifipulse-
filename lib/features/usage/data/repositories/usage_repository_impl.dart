import 'dart:convert';
import 'package:csv/csv.dart';
import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/result.dart';
import '../../../../shared/database/daos/usage_analytics_dao.dart';
import '../../domain/entities/usage_aggregates.dart';
import '../../domain/entities/usage_entity.dart';
import '../../domain/repositories/usage_repository.dart';
import '../engines/analytics_engine.dart';
import '../engines/forecast_engine.dart';

class UsageRepositoryImpl implements UsageRepository {
  final UsageAnalyticsDao _dao;
  final AnalyticsEngine _analyticsEngine;
  final ForecastEngine _forecastEngine;

  UsageRepositoryImpl(this._dao, this._analyticsEngine, this._forecastEngine);

  Future<List<UsageEntity>> _fetchAllEntities() async {
    final entries = await _dao.getAllAnalytics();
    return entries.map((e) => UsageEntity(
      id: e.id,
      deviceId: e.deviceId,
      uploadBytes: e.uploadBytes,
      downloadBytes: e.downloadBytes,
      recordedAt: e.recordedAt,
      sessionDuration: e.sessionDuration,
      foregroundUsage: e.foregroundUsage,
      wifiConnectionDuration: e.wifiConnectionDuration,
    )).toList();
  }

  @override
  Future<Result<void>> recordUsage(UsageEntity usage) async {
    try {
      // Typically handled by UsageDataCollectionService directly, but exposing it here just in case
      return right(null);
    } catch (e) {
      return left(DatabaseFailure('Failed to record usage: $e'));
    }
  }

  @override
  Future<Result<UsageSummary>> getUsageSummary() async {
    try {
      final entries = await _fetchAllEntities();
      final summary = _analyticsEngine.calculateSummary(entries);
      return right(summary);
    } catch (e) {
      return left(DatabaseFailure('Failed to get usage summary: $e'));
    }
  }

  @override
  Future<Result<List<TopDevice>>> getTopDevices({int limit = 5}) async {
    try {
      final entries = await _fetchAllEntities();
      final topDevices = _analyticsEngine.calculateTopDevices(entries, limit: limit);
      return right(topDevices);
    } catch (e) {
      return left(DatabaseFailure('Failed to get top devices: $e'));
    }
  }

  @override
  Future<Result<List<DailyUsage>>> getDailyTrends({int days = 7}) async {
    try {
      final entries = await _fetchAllEntities();
      final dailyTrends = _analyticsEngine.calculateDailyTrends(entries, days: days);
      return right(dailyTrends);
    } catch (e) {
      return left(DatabaseFailure('Failed to get daily trends: $e'));
    }
  }

  @override
  Future<Result<List<WeeklyUsage>>> getWeeklyTrends({int weeks = 4}) async {
    try {
      final entries = await _fetchAllEntities();
      final weeklyTrends = _analyticsEngine.calculateWeeklyTrends(entries, weeks: weeks);
      return right(weeklyTrends);
    } catch (e) {
      return left(DatabaseFailure('Failed to get weekly trends: $e'));
    }
  }

  @override
  Future<Result<List<MonthlyUsage>>> getMonthlyTrends({int months = 12}) async {
    try {
      final entries = await _fetchAllEntities();
      final monthlyTrends = _analyticsEngine.calculateMonthlyTrends(entries, months: months);
      return right(monthlyTrends);
    } catch (e) {
      return left(DatabaseFailure('Failed to get monthly trends: $e'));
    }
  }

  @override
  Future<Result<UsageForecast>> getForecast() async {
    try {
      final entries = await _fetchAllEntities();
      final forecast = _forecastEngine.generateForecast(entries);
      return right(forecast);
    } catch (e) {
      return left(DatabaseFailure('Failed to generate forecast: $e'));
    }
  }

  @override
  Future<Result<String>> exportUsageToCsv() async {
    try {
      final entries = await _fetchAllEntities();
      
      List<List<dynamic>> rows = [];
      rows.add([
        'ID',
        'Device ID',
        'Upload Bytes',
        'Download Bytes',
        'Recorded At',
        'Session Duration (ms)',
        'Foreground Usage (ms)',
        'WiFi Connection Duration (ms)'
      ]);

      for (final e in entries) {
        rows.add([
          e.id,
          e.deviceId,
          e.uploadBytes,
          e.downloadBytes,
          e.recordedAt.toIso8601String(),
          e.sessionDuration,
          e.foregroundUsage,
          e.wifiConnectionDuration,
        ]);
      }

      String csv = const ListToCsvConverter().convert(rows);
      return right(csv);
    } catch (e) {
      return left(DatabaseFailure('Failed to export to CSV: $e'));
    }
  }

  @override
  Future<Result<String>> exportUsageToJson() async {
    try {
      final entries = await _fetchAllEntities();
      final List<Map<String, dynamic>> jsonList = entries.map((e) => {
        'id': e.id,
        'deviceId': e.deviceId,
        'uploadBytes': e.uploadBytes,
        'downloadBytes': e.downloadBytes,
        'recordedAt': e.recordedAt.toIso8601String(),
        'sessionDuration': e.sessionDuration,
        'foregroundUsage': e.foregroundUsage,
        'wifiConnectionDuration': e.wifiConnectionDuration,
      }).toList();

      return right(jsonEncode(jsonList));
    } catch (e) {
      return left(DatabaseFailure('Failed to export to JSON: $e'));
    }
  }
}
