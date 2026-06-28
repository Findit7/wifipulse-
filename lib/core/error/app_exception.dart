sealed class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException(this.message, {this.code, this.originalError});

  @override
  String toString() =>
      'AppException(message: $message, code: $code, originalError: $originalError)';
}

class NetworkOfflineException extends AppException {
  const NetworkOfflineException([super.message = 'No internet connection.']);
}

class RouterAuthException extends AppException {
  const RouterAuthException(
      [super.message = 'Failed to authenticate with the router.']);
}

class SyncConflictException extends AppException {
  const SyncConflictException(
      [super.message = 'Data synchronization conflict occurred.']);
}

class FeatureDisabledException extends AppException {
  const FeatureDisabledException(
      [super.message =
          'This feature is currently disabled via Remote Config.']);
}

class ServerException extends AppException {
  const ServerException(super.message, {super.code, super.originalError});
}

class LocalDatabaseException extends AppException {
  const LocalDatabaseException(super.message, {super.originalError});
}
