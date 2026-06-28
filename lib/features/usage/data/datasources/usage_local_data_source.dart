import 'package:sqflite/sqflite.dart';
import '../../../../core/database/base_local_data_source.dart';
import '../../../../core/error/app_exception.dart';
import '../models/usage_history_model.dart';

abstract class UsageLocalDataSource {
  Future<void> saveUsageHistory(UsageHistoryModel history);
  Future<List<UsageHistoryModel>> getUsageHistory(String networkId,
      {int limit = 30});
}

class UsageLocalDataSourceImpl extends BaseLocalDataSource
    implements UsageLocalDataSource {
  UsageLocalDataSourceImpl(Database super.database);

  @override
  Future<void> saveUsageHistory(UsageHistoryModel history) async {
    try {
      final db = database as Database;
      await db.insert('UsageHistory', history.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw LocalDatabaseException('Failed to save usage history',
          originalError: e);
    }
  }

  @override
  Future<List<UsageHistoryModel>> getUsageHistory(String networkId,
      {int limit = 30}) async {
    try {
      final db = database as Database;
      final maps = await db.query('UsageHistory',
          where: 'network_id = ?',
          whereArgs: [networkId],
          orderBy: 'timestamp DESC',
          limit: limit);
      return maps.map((m) => UsageHistoryModel.fromMap(m)).toList();
    } catch (e) {
      throw LocalDatabaseException('Failed to get usage history',
          originalError: e);
    }
  }
}
