import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/ai_insight_entity.dart';
import '../../../security/domain/entities/security_score_entity.dart';
import '../../../usage/domain/entities/usage_summary_entity.dart';

abstract class InsightRepository {
  Future<Either<AppException, AIInsightEntity>> getLatestInsight(String networkId);
  Future<Either<AppException, List<AIInsightEntity>>> getInsightFeed(String networkId);
  
  Future<Either<AppException, AIInsightEntity>> generateInsight({
    required String networkId,
    required SecurityScoreEntity latestSecurity,
    required UsageSummaryEntity latestUsage,
    required bool aiEnabled,
  });
}
