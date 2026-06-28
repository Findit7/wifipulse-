/// Guideline for Local Data Access:
/// 
/// STRICT ARCHITECTURE RULE:
/// UI -> UseCase -> Repository -> LocalDataSource -> DatabaseHelper
/// 
/// - NEVER connect business logic directly to `DatabaseHelper` or `sqflite`.
/// - `DatabaseHelper` handles connection and schema only.
/// - `LocalDataSource` handles raw SQL execution and maps raw maps to generic DTOs.
/// - `Repository` maps DTOs to Domain Entities.
///
abstract class BaseLocalDataSource {
  /// Base class for all local data sources enforcing dependency on the generic Database connection
  /// Example:
  /// class DeviceLocalDataSourceImpl extends BaseLocalDataSource {
  ///   DeviceLocalDataSourceImpl(super.database);
  ///   ...
  /// }
  
  final dynamic database; // Typically sqflite Database instance, abstracted here

  BaseLocalDataSource(this.database);
}
