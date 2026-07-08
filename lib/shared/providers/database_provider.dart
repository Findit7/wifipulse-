import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database/app_database.dart';
import '../database/daos/device_dao.dart';
import '../database/daos/network_dao.dart';
import '../database/daos/speed_test_dao.dart';
import '../database/daos/usage_analytics_dao.dart';
import '../database/daos/security_event_dao.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

@riverpod
DeviceDao deviceDao(DeviceDaoRef ref) {
  return ref.watch(appDatabaseProvider).deviceDao;
}

@riverpod
NetworkDao networkDao(NetworkDaoRef ref) {
  return ref.watch(appDatabaseProvider).networkDao;
}

@riverpod
SpeedTestDao speedTestDao(SpeedTestDaoRef ref) {
  return ref.watch(appDatabaseProvider).speedTestDao;
}

@riverpod
UsageAnalyticsDao usageAnalyticsDao(UsageAnalyticsDaoRef ref) {
  return ref.watch(appDatabaseProvider).usageAnalyticsDao;
}

@riverpod
SecurityEventDao securityEventDao(SecurityEventDaoRef ref) {
  return ref.watch(appDatabaseProvider).securityEventDao;
}
