import 'package:drift/drift.dart';

@DataClassName('UsageAnalyticsEntry')
class UsageAnalytics extends Table {
  TextColumn get id => text()();
  TextColumn get deviceId => text()();
  IntColumn get uploadBytes => integer()();
  IntColumn get downloadBytes => integer()();
  DateTimeColumn get recordedAt => dateTime()();
  IntColumn get sessionDuration => integer().withDefault(const Constant(0))();
  IntColumn get foregroundUsage => integer().withDefault(const Constant(0))();
  IntColumn get wifiConnectionDuration => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
