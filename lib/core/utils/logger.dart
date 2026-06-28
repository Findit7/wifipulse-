import 'package:logger/logger.dart';
import 'i_logger.dart';

final Logger appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class AppLog implements ILogger {
  static final AppLog _instance = AppLog._internal();
  factory AppLog() => _instance;
  AppLog._internal();

  @override
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    appLogger.e(message, error: error, stackTrace: stackTrace);
  }

  // Static convenience wrappers to maintain existing codebase compatibility
  static void debug(dynamic m, [dynamic e, StackTrace? s]) => _instance.d(m, e, s);
  static void info(dynamic m, [dynamic e, StackTrace? s]) => _instance.i(m, e, s);
  static void warn(dynamic m, [dynamic e, StackTrace? s]) => _instance.w(m, e, s);
  static void err(dynamic m, [dynamic e, StackTrace? s]) => _instance.e(m, e, s);
}
