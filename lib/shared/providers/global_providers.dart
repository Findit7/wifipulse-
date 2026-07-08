import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/logger_service.dart';
import '../constants/env_config.dart';

part 'global_providers.g.dart';

/// Provides the centralized logger service.
@riverpod
LoggerService logger(LoggerRef ref) {
  return LoggerService();
}

/// Provides the current environment configuration.
/// 
/// Note: Ensure [EnvConfig.initialize] is called in `main.dart` before accessing this.
@riverpod
Environment environment(EnvironmentRef ref) {
  return EnvConfig.environment;
}
