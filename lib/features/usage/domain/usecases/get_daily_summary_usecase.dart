import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/usage_summary_entity.dart';
import '../repositories/usage_repository.dart';

class GetDailySummaryUseCase {
  final UsageRepository _repository;

  GetDailySummaryUseCase(this._repository);

  Future<Either<AppException, UsageSummaryEntity>> execute(String networkId) {
    return _repository.getDailySummary(networkId);
  }
}
