// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scanNetworkUseCaseHash() =>
    r'18d8a93e40aec7e809ebc2a95ad4fd2584ab46b0';

/// See also [scanNetworkUseCase].
@ProviderFor(scanNetworkUseCase)
final scanNetworkUseCaseProvider =
    AutoDisposeProvider<ScanNetworkUseCase>.internal(
  scanNetworkUseCase,
  name: r'scanNetworkUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scanNetworkUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ScanNetworkUseCaseRef = AutoDisposeProviderRef<ScanNetworkUseCase>;
String _$discoveryControllerHash() =>
    r'ba194c5311b9e6901516582e93cc53f1f576e76c';

/// See also [DiscoveryController].
@ProviderFor(DiscoveryController)
final discoveryControllerProvider =
    AutoDisposeNotifierProvider<DiscoveryController, DiscoveryState>.internal(
  DiscoveryController.new,
  name: r'discoveryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$discoveryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DiscoveryController = AutoDisposeNotifier<DiscoveryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
