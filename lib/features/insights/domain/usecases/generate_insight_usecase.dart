import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/ai_insight_entity.dart';
import '../repositories/insight_repository.dart';
import '../../../security/domain/entities/security_score_entity.dart';
import '../../../usage/domain/entities/usage_summary_entity.dart';

class GenerateInsightUseCase {
  final InsightRepository _repository;

  GenerateInsightUseCase(this._repository);

  Future<Either<AppException, AIInsightEntity>> execute({
    required String networkId,
    required SecurityScoreEntity latestSecurity,
    required UsageSummaryEntity latestUsage,
    required bool aiEnabled,
  }) {
    return _repository.generateInsight(
      networkId: networkId,
      latestSecurity: latestSecurity,
      latestUsage: latestUsage,
      aiEnabled: aiEnabled,
    );
  }
}
