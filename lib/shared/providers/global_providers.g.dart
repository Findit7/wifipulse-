// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggerHash() => r'faccd56ebedcdf26ccb047913d89ce95768fd520';

/// Provides the centralized logger service.
///
/// Copied from [logger].
@ProviderFor(logger)
final loggerProvider = AutoDisposeProvider<LoggerService>.internal(
  logger,
  name: r'loggerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggerRef = AutoDisposeProviderRef<LoggerService>;
String _$environmentHash() => r'e59f68d8b46dbba43cda20a24bf76d749c351108';

/// Provides the current environment configuration.
///
/// Note: Ensure [EnvConfig.initialize] is called in `main.dart` before accessing this.
///
/// Copied from [environment].
@ProviderFor(environment)
final environmentProvider = AutoDisposeProvider<Environment>.internal(
  environment,
  name: r'environmentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$environmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnvironmentRef = AutoDisposeProviderRef<Environment>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
