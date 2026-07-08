import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/devices.dart';
import 'tables/networks.dart';
import 'tables/speed_tests.dart';
import 'tables/usage_analytics.dart';
import 'tables/security_events.dart';

import 'daos/device_dao.dart';
import 'daos/network_dao.dart';
import 'daos/speed_test_dao.dart';
import 'daos/usage_analytics_dao.dart';
import 'daos/security_event_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Devices, Networks, SpeedTests, UsageAnalytics, SecurityEvents],
  daos: [DeviceDao, NetworkDao, SpeedTestDao, UsageAnalyticsDao, SecurityEventDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle database upgrades here in the future
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wifipulse.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
