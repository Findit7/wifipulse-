import 'package:sqflite/sqflite.dart';
import '../../../../core/database/database_helper.dart';
import '../../../../core/error/app_exception.dart';
import '../models/sync_item_model.dart';

abstract class SyncLocalDataSource {
  Future<void> insertSyncItem(SyncItemModel item);
  Future<List<SyncItemModel>> getPendingSyncItems();
  Future<void> updateSyncItemStatus(int id, String status, {int? retryCount});
  Future<void> deleteSyncItem(int id);
}

class SyncLocalDataSourceImpl implements SyncLocalDataSource {
  @override
  Future<void> insertSyncItem(SyncItemModel item) async {
    try {
      final db = await DatabaseHelper.init();
      await db.insert('SyncQueue', item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw LocalDatabaseException('Failed to insert sync item', originalError: e);
    }
  }

  @override
  Future<List<SyncItemModel>> getPendingSyncItems() async {
    try {
      final db = await DatabaseHelper.init();
      final maps = await db.query(
        'SyncQueue', 
        where: 'status = ? OR status = ?', 
        whereArgs: ['PENDING', 'FAILED'],
        orderBy: 'created_at ASC',
      );
      return maps.map((m) => SyncItemModel.fromMap(m)).toList();
    } catch (e) {
      throw LocalDatabaseException('Failed to fetch pending sync items', originalError: e);
    }
  }

  @override
  Future<void> updateSyncItemStatus(int id, String status, {int? retryCount}) async {
    try {
      final db = await DatabaseHelper.init();
      Map<String, dynamic> updateData = {'status': status};
      if (retryCount != null) {
        updateData['retry_count'] = retryCount;
      }
      await db.update('SyncQueue', updateData, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw LocalDatabaseException('Failed to update sync item status', originalError: e);
    }
  }

  @override
  Future<void> deleteSyncItem(int id) async {
    try {
      final db = await DatabaseHelper.init();
      await db.delete('SyncQueue', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw LocalDatabaseException('Failed to delete sync item', originalError: e);
    }
  }
}
