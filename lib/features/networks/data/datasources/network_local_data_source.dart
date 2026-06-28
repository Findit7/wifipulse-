import 'package:sqflite/sqflite.dart';
import '../../../../core/database/base_local_data_source.dart';
import '../../../../core/error/app_exception.dart';
import '../models/network_model.dart';
import '../models/router_model.dart';

abstract class NetworkLocalDataSource {
  Future<void> saveNetwork(NetworkModel network);
  Future<NetworkModel?> getNetwork(String id);
  Future<List<NetworkModel>> getNetworksForUser(String userId);
  Future<void> saveRouter(RouterModel router);
  Future<RouterModel?> getRouter(String networkId);
}

class NetworkLocalDataSourceImpl extends BaseLocalDataSource
    implements NetworkLocalDataSource {
  NetworkLocalDataSourceImpl(Database super.database);

  @override
  Future<void> saveNetwork(NetworkModel network) async {
    try {
      final db = database as Database;
      await db.insert('Networks', network.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw LocalDatabaseException('Failed to save network', originalError: e);
    }
  }

  @override
  Future<NetworkModel?> getNetwork(String id) async {
    try {
      final db = database as Database;
      final maps = await db.query('Networks', where: 'id = ?', whereArgs: [id]);
      if (maps.isNotEmpty) return NetworkModel.fromMap(maps.first);
      return null;
    } catch (e) {
      throw LocalDatabaseException('Failed to get network', originalError: e);
    }
  }

  @override
  Future<List<NetworkModel>> getNetworksForUser(String userId) async {
    try {
      final db = database as Database;
      final maps =
          await db.query('Networks', where: 'user_id = ?', whereArgs: [userId]);
      return maps.map((m) => NetworkModel.fromMap(m)).toList();
    } catch (e) {
      throw LocalDatabaseException('Failed to get networks for user',
          originalError: e);
    }
  }

  @override
  Future<void> saveRouter(RouterModel router) async {
    try {
      final db = database as Database;
      await db.insert('Routers', router.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw LocalDatabaseException('Failed to save router', originalError: e);
    }
  }

  @override
  Future<RouterModel?> getRouter(String networkId) async {
    try {
      final db = database as Database;
      final maps = await db
          .query('Routers', where: 'network_id = ?', whereArgs: [networkId]);
      if (maps.isNotEmpty) return RouterModel.fromMap(maps.first);
      return null;
    } catch (e) {
      throw LocalDatabaseException('Failed to get router', originalError: e);
    }
  }
}
