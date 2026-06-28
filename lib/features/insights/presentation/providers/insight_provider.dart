import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/ai_insight_entity.dart';
import '../../domain/usecases/generate_insight_usecase.dart';
import '../../domain/usecases/get_insight_feed_usecase.dart';
import '../../../security/presentation/providers/security_provider.dart';
import '../../../usage/presentation/providers/usage_provider.dart';
import '../../../../core/di/repository_providers.dart';
import '../../../../core/flags/feature_flag_repository.dart';

part 'insight_provider.g.dart';

class InsightState {
  final bool isLoading;
  final AIInsightEntity? latestInsight;
  final List<AIInsightEntity> feed;
  final String? error;

  const InsightState({
    this.isLoading = false,
    this.latestInsight,
    this.feed = const [],
    this.error,
  });

  InsightState copyWith({
    bool? isLoading,
    AIInsightEntity? latestInsight,
    List<AIInsightEntity>? feed,
    String? error,
  }) {
    return InsightState(
      isLoading: isLoading ?? this.isLoading,
      latestInsight: latestInsight ?? this.latestInsight,
      feed: feed ?? this.feed,
      error: error,
    );
  }
}


@riverpod
GenerateInsightUseCase generateInsightUseCase(GenerateInsightUseCaseRef ref) {
  return GenerateInsightUseCase(ref.watch(insightRepositoryProvider));
}

@riverpod
GetInsightFeedUseCase getInsightFeedUseCase(GetInsightFeedUseCaseRef ref) {
  return GetInsightFeedUseCase(ref.watch(insightRepositoryProvider));
}


@riverpod
FutureOr<bool> aiFeatureFlag(AiFeatureFlagRef ref) async {
  final repo = FeatureFlagRepository();
  return repo.isEnabled('ai_insights_enabled', defaultValue: false);
}

@riverpod
class InsightController extends _$InsightController {
  @override
  InsightState build() {
    return const InsightState();
  }

  Future<void> fetchInsights(String networkId) async {
    state = state.copyWith(isLoading: true, error: null);

    final securityState = ref.read(securityControllerProvider);
    final usageState = await ref.read(usageControllerProvider.future);
    final aiEnabled = await ref.read(aiFeatureFlagProvider.future);

    if (securityState.currentScore == null) {
      state = state.copyWith(isLoading: false, error: 'Security score required to generate insights.');
      return;
    }

    final generateUseCase = ref.read(generateInsightUseCaseProvider);
    final feedUseCase = ref.read(getInsightFeedUseCaseProvider);

    final generateResult = await generateUseCase.execute(
      networkId: networkId,
      latestSecurity: securityState.currentScore!,
      latestUsage: usageState,
      aiEnabled: aiEnabled,
    );

    generateResult.fold(
      (error) => state = state.copyWith(isLoading: false, error: error.message),
      (latest) async {
        final feedResult = await feedUseCase.execute(networkId);
        
        state = state.copyWith(
          isLoading: false,
          latestInsight: latest,
          feed: feedResult.getOrElse((_) => [latest]),
        );
      },
    );
  }
}
