import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/dashboard_summary_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardSummaryUseCase {
  final DashboardRepository _repository;

  GetDashboardSummaryUseCase(this._repository);

  Future<Either<AppException, DashboardSummaryEntity>> execute(String userId) {
    return _repository.getSummary(userId);
  }
}
