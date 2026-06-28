import 'package:sqflite/sqflite.dart';
import '../../domain/entities/ai_insight_entity.dart';
import '../../../../core/database/database_helper.dart';

abstract class InsightLocalDataSource {
  Future<void> saveInsight(AIInsightEntity insight);
  Future<AIInsightEntity?> getLatestValidInsight(String networkId);
  Future<List<AIInsightEntity>> getAllValidInsights(String networkId);
}

class InsightLocalDataSourceImpl implements InsightLocalDataSource {

  @override
  Future<void> saveInsight(AIInsightEntity insight) async {
    final db = await DatabaseHelper.init();
    await db.insert(
      'AIInsights',
      {
        'id': insight.id,
        'network_id': insight.networkId,
        'insight_text': insight.insightText,
        'category': insight.category,
        'is_locally_generated': insight.isLocallyGenerated ? 1 : 0,
        'created_at': insight.createdAt.toIso8601String(),
        'expires_at': insight.expiresAt.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<AIInsightEntity?> getLatestValidInsight(String networkId) async {
    final insights = await getAllValidInsights(networkId);
    if (insights.isEmpty) return null;
    return insights.first;
  }

  @override
  Future<List<AIInsightEntity>> getAllValidInsights(String networkId) async {
    final db = await DatabaseHelper.init();
    final now = DateTime.now().toIso8601String();
    
    final maps = await db.query(
      'AIInsights',
      where: 'network_id = ? AND expires_at > ?',
      whereArgs: [networkId, now],
      orderBy: 'created_at DESC',
    );

    return maps.map((map) => AIInsightEntity(
      id: map['id'] as String,
      networkId: map['network_id'] as String,
      insightText: map['insight_text'] as String,
      category: map['category'] as String,
      isLocallyGenerated: (map['is_locally_generated'] as int) == 1,
      createdAt: DateTime.parse(map['created_at'] as String),
      expiresAt: DateTime.parse(map['expires_at'] as String),
    )).toList();
  }
}
