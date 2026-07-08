import 'package:drift/drift.dart';

@DataClassName('DeviceEntry')
class Devices extends Table {
  TextColumn get id => text()();
  TextColumn get ipAddress => text()();
  TextColumn get macAddress => text()();
  TextColumn get hostname => text().nullable()();
  TextColumn get vendor => text().nullable()();
  TextColumn get deviceType => text().nullable()();
  DateTimeColumn get firstSeen => dateTime()();
  DateTimeColumn get lastSeen => dateTime()();
  BoolColumn get isTrusted => boolean().withDefault(const Constant(false))();
  IntColumn get riskScore => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
