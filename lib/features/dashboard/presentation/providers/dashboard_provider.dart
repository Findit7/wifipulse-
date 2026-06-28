import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/dashboard_summary_entity.dart';
import '../../domain/usecases/get_dashboard_summary_usecase.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../../core/di/repository_providers.dart';

part 'dashboard_provider.g.dart';

@riverpod
GetDashboardSummaryUseCase getDashboardSummaryUseCase(GetDashboardSummaryUseCaseRef ref) {
  return GetDashboardSummaryUseCase(ref.watch(dashboardRepositoryProvider));
}

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardSummaryEntity> build() async {
    final useCase = ref.watch(getDashboardSummaryUseCaseProvider);
    final user = ref.watch(authControllerProvider).valueOrNull;
    final userId = user?.id ?? 'guest';

    final result = await useCase.execute(userId);
    return result.fold(
      (error) => throw error,
      (summary) => summary,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
  }
}
