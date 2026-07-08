// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'3d3a397d2ea952fc020fce0506793a5564e93530';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$deviceDaoHash() => r'320bc4bd853bcc290b8ea2d97c502691696c515e';

/// See also [deviceDao].
@ProviderFor(deviceDao)
final deviceDaoProvider = AutoDisposeProvider<DeviceDao>.internal(
  deviceDao,
  name: r'deviceDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deviceDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceDaoRef = AutoDisposeProviderRef<DeviceDao>;
String _$networkDaoHash() => r'ad62018ac727b496450b926ffaab9510a67091ef';

/// See also [networkDao].
@ProviderFor(networkDao)
final networkDaoProvider = AutoDisposeProvider<NetworkDao>.internal(
  networkDao,
  name: r'networkDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkDaoRef = AutoDisposeProviderRef<NetworkDao>;
String _$speedTestDaoHash() => r'8c35a139d51a73425c3cbaa123d54397dd09e668';

/// See also [speedTestDao].
@ProviderFor(speedTestDao)
final speedTestDaoProvider = AutoDisposeProvider<SpeedTestDao>.internal(
  speedTestDao,
  name: r'speedTestDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$speedTestDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpeedTestDaoRef = AutoDisposeProviderRef<SpeedTestDao>;
String _$usageAnalyticsDaoHash() => r'22e2aae12ea91969e0ce8dc78cbd5647b648713d';

/// See also [usageAnalyticsDao].
@ProviderFor(usageAnalyticsDao)
final usageAnalyticsDaoProvider =
    AutoDisposeProvider<UsageAnalyticsDao>.internal(
  usageAnalyticsDao,
  name: r'usageAnalyticsDaoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usageAnalyticsDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsageAnalyticsDaoRef = AutoDisposeProviderRef<UsageAnalyticsDao>;
String _$securityEventDaoHash() => r'742c7694202b38659a72b61eeabdc0dd8ec1aa5d';

/// See also [securityEventDao].
@ProviderFor(securityEventDao)
final securityEventDaoProvider = AutoDisposeProvider<SecurityEventDao>.internal(
  securityEventDao,
  name: r'securityEventDaoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$securityEventDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SecurityEventDaoRef = AutoDisposeProviderRef<SecurityEventDao>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
