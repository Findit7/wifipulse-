class EnvConfig {
  static const String environment = String.fromEnvironment('ENV', defaultValue: 'dev');
  
  static const String devBaseUrl = 'https://dev-api.wifipulse.local/api/v1';
  static const String prodBaseUrl = 'https://api.wifipulse.local/api/v1';

  static String get baseUrl {
    switch (environment) {
      case 'prod':
        return prodBaseUrl;
      case 'dev':
      default:
        return devBaseUrl;
    }
  }

  static bool get isDev => environment == 'dev';
}
