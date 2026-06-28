import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/repositories/insight_repository.dart';
import '../../domain/entities/ai_insight_entity.dart';
import '../../../security/domain/entities/security_score_entity.dart';
import '../../../usage/domain/entities/usage_summary_entity.dart';
import '../engines/rule_based_insight_generator.dart';
import '../datasources/insight_local_data_source.dart';
import '../datasources/insight_remote_data_source.dart';

class InsightRepositoryImpl implements InsightRepository {
  final InsightLocalDataSource _localDataSource;
  final InsightRemoteDataSource _remoteDataSource;
  final RuleBasedInsightGenerator _ruleGenerator;

  InsightRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._ruleGenerator,
  );

  @override
  Future<Either<AppException, AIInsightEntity>> getLatestInsight(String networkId) async {
    return ErrorHandler.execute(() async {
      final cached = await _localDataSource.getLatestValidInsight(networkId);
      if (cached != null) return cached;
      throw const ServerException('No valid insight cached.');
    });
  }

  @override
  Future<Either<AppException, List<AIInsightEntity>>> getInsightFeed(String networkId) async {
    return ErrorHandler.execute(() async {
      return _localDataSource.getAllValidInsights(networkId);
    });
  }

  @override
  Future<Either<AppException, AIInsightEntity>> generateInsight({
    required String networkId,
    required SecurityScoreEntity latestSecurity,
    required UsageSummaryEntity latestUsage,
    required bool aiEnabled,
  }) async {
    return ErrorHandler.execute(() async {
      // Offline-First caching layer check
      final cached = await _localDataSource.getLatestValidInsight(networkId);
      if (cached != null) {
        return cached; 
      }

      AIInsightEntity generatedInsight;

      if (aiEnabled) {
        try {
          generatedInsight = await _remoteDataSource.fetchAiInsight(
            networkId: networkId,
            securityScore: latestSecurity,
            usageSummary: latestUsage,
          );
        } catch (e) {
          AppLog().w('AI Insight Generation failed, falling back to local rules.', e);
          generatedInsight = _ruleGenerator.generateFallbackInsight(
            networkId: networkId,
            securityScore: latestSecurity,
            usageSummary: latestUsage,
          );
        }
      } else {
        generatedInsight = _ruleGenerator.generateFallbackInsight(
          networkId: networkId,
          securityScore: latestSecurity,
          usageSummary: latestUsage,
        );
      }

      await _localDataSource.saveInsight(generatedInsight);

      return generatedInsight;
    });
  }
}
