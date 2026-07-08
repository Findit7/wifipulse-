import 'package:drift/drift.dart';

@DataClassName('SecurityEventEntry')
class SecurityEvents extends Table {
  TextColumn get id => text()();
  TextColumn get eventType => text()();
  TextColumn get severity => text()();
  TextColumn get description => text()();
  DateTimeColumn get timestamp => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
