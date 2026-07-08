/// Represents the current environment configuration.
enum Environment {
  development,
  staging,
  production,
}

/// Singleton configuration class for environment variables.
class EnvConfig {
  static late final Environment environment;
  static late final String apiBaseUrl;
  static late final bool enableAnalytics;

  // Private constructor to prevent instantiation.
  EnvConfig._();

  /// Initializes the environment configuration.
  static void initialize(Environment env) {
    environment = env;
    switch (env) {
      case Environment.development:
        apiBaseUrl = 'https://dev-api.wifipulse.com';
        enableAnalytics = false;
        break;
      case Environment.staging:
        apiBaseUrl = 'https://staging-api.wifipulse.com';
        enableAnalytics = true;
        break;
      case Environment.production:
        apiBaseUrl = 'https://api.wifipulse.com';
        enableAnalytics = true;
        break;
    }
  }
}
