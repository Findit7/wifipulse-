import '../../../../core/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class FeatureFlagRepository {
  Future<bool> isEnabled(String key, {bool defaultValue = false}) async {
    try {
      final db = await DatabaseHelper.init();
      final maps = await db.query(
        'FeatureFlags',
        where: 'key = ?',
        whereArgs: [key],
      );
      if (maps.isEmpty) return defaultValue;
      return (maps.first['is_enabled'] as int) == 1;
    } catch (_) {
      return defaultValue;
    }
  }

  Future<void> setFlag(String key, bool isEnabled) async {
    final db = await DatabaseHelper.init();
    await db.insert(
      'FeatureFlags',
      {
        'key': key,
        'is_enabled': isEnabled ? 1 : 0,
        'updated_at': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
