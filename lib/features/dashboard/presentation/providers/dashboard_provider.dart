import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../domain/usecases/get_dashboard_summary_usecase.dart';

part 'dashboard_provider.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardStatus> build() async {
    return _fetchStatus();
  }

  Future<DashboardStatus> _fetchStatus() async {
    final useCase = ref.watch(getDashboardSummaryUseCaseProvider);
    final result = await useCase.execute();
    
    return result.fold(
      (failure) => throw Exception(failure.message),
      (status) => status,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final status = await _fetchStatus();
      state = AsyncValue.data(status);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
