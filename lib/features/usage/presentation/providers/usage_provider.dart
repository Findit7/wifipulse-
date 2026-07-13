import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/providers/database_provider.dart';
import '../../data/engines/analytics_engine.dart';
import '../../data/engines/forecast_engine.dart';
import '../../data/repositories/usage_repository_impl.dart';
import '../../domain/entities/usage_aggregates.dart';
import '../../domain/repositories/usage_repository.dart';
import '../../domain/usecases/get_usage_summary_usecase.dart';
import '../../domain/usecases/get_trends_usecase.dart';
import '../../domain/usecases/get_forecast_usecase.dart';
import '../../domain/usecases/export_usage_usecase.dart';
import '../../data/services/usage_collection_service.dart';

part 'usage_provider.g.dart';

@riverpod
AnalyticsEngine analyticsEngine(Ref ref) => AnalyticsEngine();

@riverpod
ForecastEngine forecastEngine(Ref ref) => ForecastEngine();

@riverpod
UsageRepository usageRepository(Ref ref) {
  final dao = ref.watch(usageAnalyticsDaoProvider);
  final analyticsEngine = ref.watch(analyticsEngineProvider);
  final forecastEngine = ref.watch(forecastEngineProvider);
  return UsageRepositoryImpl(dao, analyticsEngine, forecastEngine);
}

@riverpod
GetUsageSummaryUseCase getUsageSummaryUseCase(Ref ref) {
  return GetUsageSummaryUseCase(ref.watch(usageRepositoryProvider));
}

@riverpod
GetTrendsUseCase getTrendsUseCase(Ref ref) {
  return GetTrendsUseCase(ref.watch(usageRepositoryProvider));
}

@riverpod
GetForecastUseCase getForecastUseCase(Ref ref) {
  return GetForecastUseCase(ref.watch(usageRepositoryProvider));
}

@riverpod
ExportUsageUseCase exportUsageUseCase(Ref ref) {
  return ExportUsageUseCase(ref.watch(usageRepositoryProvider));
}

@riverpod
class UsageCollectionController extends _$UsageCollectionController {
  UsageDataCollectionService? _service;

  @override
  bool build() {
    final dao = ref.watch(usageAnalyticsDaoProvider);
    _service = UsageDataCollectionService(dao);
    // Start collection on build
    _service?.startCollection();
    
    ref.onDispose(() {
      _service?.stopCollection();
    });
    
    return true; // Indicates it is running
  }
}

@riverpod
Future<UsageSummary?> usageSummary(Ref ref) async {
  // Watch a ticker to refresh every 30s
  final _ = ref.watch(usageRefreshTickerProvider);
  final useCase = ref.watch(getUsageSummaryUseCaseProvider);
  final result = await useCase.execute();
  return result.fold(
    (l) => null,
    (r) => r,
  );
}

@riverpod
Future<List<TopDevice>> topDevices(Ref ref) async {
  final _ = ref.watch(usageRefreshTickerProvider);
  final repository = ref.watch(usageRepositoryProvider);
  final result = await repository.getTopDevices();
  return result.fold(
    (l) => [],
    (r) => r,
  );
}

@riverpod
Future<List<DailyUsage>> dailyTrends(Ref ref) async {
  final _ = ref.watch(usageRefreshTickerProvider);
  final useCase = ref.watch(getTrendsUseCaseProvider);
  final result = await useCase.executeDaily();
  return result.fold(
    (l) => [],
    (r) => r,
  );
}

@riverpod
Future<UsageForecast?> usageForecast(Ref ref) async {
  final _ = ref.watch(usageRefreshTickerProvider);
  final useCase = ref.watch(getForecastUseCaseProvider);
  final result = await useCase.execute();
  return result.fold(
    (l) => null,
    (r) => r,
  );
}

// A simple timer-based provider that yields a new value every 30 seconds
@riverpod
Stream<int> usageRefreshTicker(Ref ref) {
  return Stream.periodic(const Duration(seconds: 30), (count) => count);
}
