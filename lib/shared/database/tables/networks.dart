import 'package:drift/drift.dart';

@DataClassName('NetworkEntry')
class Networks extends Table {
  TextColumn get id => text()();
  TextColumn get ssid => text()();
  TextColumn get bssid => text()();
  TextColumn get gatewayIp => text()();
  TextColumn get routerVendor => text().nullable()();
  TextColumn get securityType => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
