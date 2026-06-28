// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDashboardSummaryUseCaseHash() =>
    r'3d79235d83e169d7e102b79c1d1da2ffe774a652';

/// See also [getDashboardSummaryUseCase].
@ProviderFor(getDashboardSummaryUseCase)
final getDashboardSummaryUseCaseProvider =
    AutoDisposeProvider<GetDashboardSummaryUseCase>.internal(
  getDashboardSummaryUseCase,
  name: r'getDashboardSummaryUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDashboardSummaryUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDashboardSummaryUseCaseRef
    = AutoDisposeProviderRef<GetDashboardSummaryUseCase>;
String _$dashboardControllerHash() =>
    r'5db2308cfcaa8ff9ea6fb80e326dcb3a5441bc55';

/// See also [DashboardController].
@ProviderFor(DashboardController)
final dashboardControllerProvider = AutoDisposeAsyncNotifierProvider<
    DashboardController, DashboardSummaryEntity>.internal(
  DashboardController.new,
  name: r'dashboardControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DashboardController
    = AutoDisposeAsyncNotifier<DashboardSummaryEntity>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
