import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/ai_insight_entity.dart';
import '../repositories/insight_repository.dart';

class GetInsightFeedUseCase {
  final InsightRepository _repository;

  GetInsightFeedUseCase(this._repository);

  Future<Either<AppException, List<AIInsightEntity>>> execute(String networkId) {
    return _repository.getInsightFeed(networkId);
  }
}
