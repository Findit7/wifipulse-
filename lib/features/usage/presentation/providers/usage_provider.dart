import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/usage_summary_entity.dart';
import '../../domain/usecases/get_daily_summary_usecase.dart';
import '../../../../core/di/repository_providers.dart';

part 'usage_provider.g.dart';

@riverpod
GetDailySummaryUseCase getDailySummaryUseCase(GetDailySummaryUseCaseRef ref) {
  return GetDailySummaryUseCase(ref.watch(usageRepositoryProvider));
}

@riverpod
class UsageController extends _$UsageController {
  @override
  FutureOr<UsageSummaryEntity> build() async {
    return fetchUsage('active_network_id'); 
  }

  Future<UsageSummaryEntity> fetchUsage(String networkId) async {
    final useCase = ref.watch(getDailySummaryUseCaseProvider);
    final result = await useCase.execute(networkId);
    return result.fold(
      (error) => throw error,
      (summary) => summary,
    );
  }
}
