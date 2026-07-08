import 'package:logger/logger.dart';

/// Centralized logging service for the application.
class LoggerService {
  final Logger _logger;

  LoggerService()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 120,
            colors: true,
            printEmojis: true,
            dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
          ),
        );

  /// Logs a debug message. Useful for general development output.
  void debug(String message) {
    _logger.d(message);
  }

  /// Logs an informational message.
  void info(String message) {
    _logger.i(message);
  }

  /// Logs a warning message.
  void warning(String message) {
    _logger.w(message);
  }

  /// Logs an error message, optionally with an exception and stack trace.
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Specialized log for database operations.
  void dbLog(String message) {
    _logger.t('💾 [DB] $message');
  }

  /// Specialized log for network operations.
  void networkLog(String message) {
    _logger.t('🌐 [Network] $message');
  }
}
