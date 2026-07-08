/// Base failure class representing a failure in the application.
abstract class Failure {
  final String message;
  final Exception? exception;
  final StackTrace? stackTrace;

  const Failure(this.message, {this.exception, this.stackTrace});

  @override
  String toString() => 'Failure(message: $message, exception: $exception)';
}

/// Represents a failure related to network connectivity or API calls.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.exception, super.stackTrace});
}

/// Represents a failure related to local database operations.
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message, {super.exception, super.stackTrace});
}

/// Represents a failure related to router interactions.
class RouterFailure extends Failure {
  const RouterFailure(super.message, {super.exception, super.stackTrace});
}

/// Represents a failure due to insufficient permissions.
class PermissionFailure extends Failure {
  const PermissionFailure(super.message, {super.exception, super.stackTrace});
}

/// Represents a failure during user authentication.
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message, {super.exception, super.stackTrace});
}

/// Represents an unknown or unexpected failure.
class UnknownFailure extends Failure {
  const UnknownFailure(super.message, {super.exception, super.stackTrace});
}
