import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/speed_tests.dart';

part 'speed_test_dao.g.dart';

@DriftAccessor(tables: [SpeedTests])
class SpeedTestDao extends DatabaseAccessor<AppDatabase> with _$SpeedTestDaoMixin {
  SpeedTestDao(super.db);

  Future<List<SpeedTestEntry>> getAllSpeedTests() => select(speedTests).get();

  Future<int> insertSpeedTest(SpeedTestsCompanion speedTest) => into(speedTests).insert(speedTest);
}
