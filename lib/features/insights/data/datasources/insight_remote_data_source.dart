import 'package:dio/dio.dart';
import '../../domain/entities/ai_insight_entity.dart';
import '../../../security/domain/entities/security_score_entity.dart';
import '../../../usage/domain/entities/usage_summary_entity.dart';

abstract class InsightRemoteDataSource {
  Future<AIInsightEntity> fetchAiInsight({
    required String networkId,
    required SecurityScoreEntity securityScore,
    required UsageSummaryEntity usageSummary,
  });
}

class InsightRemoteDataSourceImpl implements InsightRemoteDataSource {
  final Dio _dio;

  InsightRemoteDataSourceImpl(this._dio);

  @override
  Future<AIInsightEntity> fetchAiInsight({
    required String networkId,
    required SecurityScoreEntity securityScore,
    required UsageSummaryEntity usageSummary,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); 
    
    return AIInsightEntity(
      id: 'ai_${DateTime.now().millisecondsSinceEpoch}',
      networkId: networkId,
      insightText: 'AI Analysis: Your network traffic patterns match a typical weekend streaming session. Security is optimal. Consider enabling QoS for Smart TVs if you experience buffering.',
      category: 'Performance',
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(hours: 24)),
      isLocallyGenerated: false,
    );
  }
}
