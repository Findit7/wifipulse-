import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/security_events.dart';

part 'security_event_dao.g.dart';

@DriftAccessor(tables: [SecurityEvents])
class SecurityEventDao extends DatabaseAccessor<AppDatabase> with _$SecurityEventDaoMixin {
  SecurityEventDao(super.db);

  Future<List<SecurityEventEntry>> getAllSecurityEvents() => select(securityEvents).get();

  Future<int> insertSecurityEvent(SecurityEventsCompanion event) => into(securityEvents).insert(event);
}
