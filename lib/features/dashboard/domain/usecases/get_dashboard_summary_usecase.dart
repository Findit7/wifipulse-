import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/dashboard_repository.dart';
import '../entities/dashboard_entities.dart';
import '../../../../core/di/repository_providers.dart';

part 'get_dashboard_summary_usecase.g.dart';

class GetDashboardSummaryUseCase {
  final DashboardRepository repository;

  GetDashboardSummaryUseCase(this.repository);

  Future<Result<DashboardStatus>> execute() => repository.getDashboardStatus();
}

@riverpod
GetDashboardSummaryUseCase getDashboardSummaryUseCase(GetDashboardSummaryUseCaseRef ref) {
  return GetDashboardSummaryUseCase(ref.watch(dashboardRepositoryProvider));
}
