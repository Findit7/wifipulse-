// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generateInsightUseCaseHash() =>
    r'caf5ffab90b824dd43513da3d14610345874d529';

/// See also [generateInsightUseCase].
@ProviderFor(generateInsightUseCase)
final generateInsightUseCaseProvider =
    AutoDisposeProvider<GenerateInsightUseCase>.internal(
  generateInsightUseCase,
  name: r'generateInsightUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$generateInsightUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GenerateInsightUseCaseRef
    = AutoDisposeProviderRef<GenerateInsightUseCase>;
String _$getInsightFeedUseCaseHash() =>
    r'bf643c15cbe39f4a18bd8e2bb3b81392dcc8f420';

/// See also [getInsightFeedUseCase].
@ProviderFor(getInsightFeedUseCase)
final getInsightFeedUseCaseProvider =
    AutoDisposeProvider<GetInsightFeedUseCase>.internal(
  getInsightFeedUseCase,
  name: r'getInsightFeedUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getInsightFeedUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetInsightFeedUseCaseRef
    = AutoDisposeProviderRef<GetInsightFeedUseCase>;
String _$aiFeatureFlagHash() => r'865ca539dfb3adf57f7e1fa092efb16ec2b6744d';

/// See also [aiFeatureFlag].
@ProviderFor(aiFeatureFlag)
final aiFeatureFlagProvider = AutoDisposeFutureProvider<bool>.internal(
  aiFeatureFlag,
  name: r'aiFeatureFlagProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aiFeatureFlagHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AiFeatureFlagRef = AutoDisposeFutureProviderRef<bool>;
String _$insightControllerHash() => r'd794c3c2cef1b01f4e985ec8ce8df6a71eb96599';

/// See also [InsightController].
@ProviderFor(InsightController)
final insightControllerProvider =
    AutoDisposeNotifierProvider<InsightController, InsightState>.internal(
  InsightController.new,
  name: r'insightControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$insightControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InsightController = AutoDisposeNotifier<InsightState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
