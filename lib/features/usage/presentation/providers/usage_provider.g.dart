// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDailySummaryUseCaseHash() =>
    r'1f052517c62b3251ec4d8ee0ef7c3ebfdbf45077';

/// See also [getDailySummaryUseCase].
@ProviderFor(getDailySummaryUseCase)
final getDailySummaryUseCaseProvider =
    AutoDisposeProvider<GetDailySummaryUseCase>.internal(
  getDailySummaryUseCase,
  name: r'getDailySummaryUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDailySummaryUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDailySummaryUseCaseRef
    = AutoDisposeProviderRef<GetDailySummaryUseCase>;
String _$usageControllerHash() => r'273c92b11dfeac317c7b8317bd13c39f54209530';

/// See also [UsageController].
@ProviderFor(UsageController)
final usageControllerProvider = AutoDisposeAsyncNotifierProvider<
    UsageController, UsageSummaryEntity>.internal(
  UsageController.new,
  name: r'usageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UsageController = AutoDisposeAsyncNotifier<UsageSummaryEntity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
