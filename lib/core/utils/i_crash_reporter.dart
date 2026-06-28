abstract class ICrashReporter {
  /// Logs a non-fatal exception to the crash reporting service
  Future<void> recordError(dynamic exception, StackTrace? stack, {dynamic reason, bool fatal = false});
  
  /// Logs a standard message to the crash reporting service
  Future<void> log(String message);
  
  /// Sets user identifier for crash grouping
  Future<void> setUserId(String identifier);
  
  /// Sets custom keys for crash context
  Future<void> setCustomKey(String key, Object value);
}
