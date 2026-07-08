import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/networks.dart';

part 'network_dao.g.dart';

@DriftAccessor(tables: [Networks])
class NetworkDao extends DatabaseAccessor<AppDatabase> with _$NetworkDaoMixin {
  NetworkDao(super.db);

  Future<List<NetworkEntry>> getAllNetworks() => select(networks).get();
  
  Future<NetworkEntry?> getNetworkById(String id) =>
      (select(networks)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertNetwork(NetworksCompanion network) => into(networks).insert(network);

  Future<bool> updateNetwork(NetworksCompanion network) => update(networks).replace(network);

  Future<int> deleteNetwork(String id) =>
      (delete(networks)..where((t) => t.id.equals(id))).go();
}
