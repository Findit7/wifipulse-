import 'package:drift/drift.dart';

@DataClassName('SpeedTestEntry')
class SpeedTests extends Table {
  TextColumn get id => text()();
  RealColumn get downloadSpeed => real()();
  RealColumn get uploadSpeed => real()();
  RealColumn get ping => real()();
  RealColumn get jitter => real()();
  DateTimeColumn get timestamp => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
