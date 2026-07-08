import 'package:drift/drift.dart';

@DataClassName('UsageAnalyticsEntry')
class UsageAnalytics extends Table {
  TextColumn get id => text()();
  TextColumn get deviceId => text()();
  IntColumn get uploadBytes => integer()();
  IntColumn get downloadBytes => integer()();
  DateTimeColumn get recordedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
