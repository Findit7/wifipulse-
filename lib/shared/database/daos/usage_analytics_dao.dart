import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/usage_analytics.dart';

part 'usage_analytics_dao.g.dart';

@DriftAccessor(tables: [UsageAnalytics])
class UsageAnalyticsDao extends DatabaseAccessor<AppDatabase> with _$UsageAnalyticsDaoMixin {
  UsageAnalyticsDao(super.db);

  Future<List<UsageAnalyticsEntry>> getAnalyticsForDevice(String deviceId) =>
      (select(usageAnalytics)..where((t) => t.deviceId.equals(deviceId))).get();

  Future<int> insertAnalytics(UsageAnalyticsCompanion analytics) => into(usageAnalytics).insert(analytics);
}
