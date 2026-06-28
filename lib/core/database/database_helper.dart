import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../utils/logger.dart';

part 'database_helper.g.dart';

@Riverpod(keepAlive: true)
Future<Database> database(DatabaseRef ref) async {
  return await DatabaseHelper.init();
}

class DatabaseHelper {
  static const String _dbName = 'wifipulse.db';
  static const int _dbVersion = 2;

  static Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    AppLog().i('Initializing SQLite Database at: $path');

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  static Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
    await db.execute('PRAGMA synchronous = NORMAL');
    await db.execute('PRAGMA journal_mode = WAL');
  }

  static Future<void> _onCreate(Database db, int version) async {
    AppLog().i('Creating local database schema (v1 base)...');
    
    // Networks Table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Networks (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        ssid TEXT NOT NULL,
        bssid TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');

    // Devices Table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Devices (
        id TEXT PRIMARY KEY,
        network_id TEXT NOT NULL,
        mac_address TEXT NOT NULL,
        ip_address TEXT,
        hostname TEXT,
        custom_name TEXT,
        vendor TEXT,
        device_type TEXT NOT NULL,
        os_guess TEXT,
        fingerprint_hash TEXT,
        is_trusted INTEGER DEFAULT 0,
        is_online INTEGER DEFAULT 0,
        first_seen TEXT NOT NULL,
        last_seen TEXT NOT NULL,
        FOREIGN KEY (network_id) REFERENCES Networks (id) ON DELETE CASCADE
      )
    ''');
    
    await db.execute('CREATE INDEX IF NOT EXISTS idx_devices_network_mac ON Devices(network_id, mac_address)');

    // SyncQueue Table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS SyncQueue (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        entity_type TEXT NOT NULL,
        entity_id TEXT NOT NULL,
        action TEXT NOT NULL,
        payload TEXT NOT NULL,
        status TEXT NOT NULL,
        retry_count INTEGER DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');

    // Apply migrations for any versions > 1
    for (int i = 2; i <= version; i++) {
      await _migrate(db, i);
    }
  }

  static Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    AppLog().i('Upgrading database from $oldVersion to $newVersion');
    for (int i = oldVersion + 1; i <= newVersion; i++) {
      await _migrate(db, i);
    }
  }

  static Future<void> _migrate(Database db, int version) async {
    switch (version) {
      case 2:
        AppLog().i('Running migration v2: Adding SecurityScores, Alerts, AIInsights, UsageHistory, FeatureFlags');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS SecurityScores (
            id TEXT PRIMARY KEY,
            network_id TEXT NOT NULL,
            overall_score INTEGER NOT NULL,
            encryption_type TEXT,
            open_ports_detected TEXT NOT NULL,
            untrusted_devices_count INTEGER NOT NULL,
            timestamp TEXT NOT NULL,
            risk_level TEXT NOT NULL,
            passed_checks TEXT NOT NULL,
            failed_checks TEXT NOT NULL,
            unsupported_checks TEXT NOT NULL,
            FOREIGN KEY (network_id) REFERENCES Networks (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS Alerts (
            id TEXT PRIMARY KEY,
            network_id TEXT NOT NULL,
            type TEXT NOT NULL,
            title TEXT NOT NULL,
            message TEXT NOT NULL,
            is_read INTEGER DEFAULT 0,
            created_at TEXT NOT NULL,
            FOREIGN KEY (network_id) REFERENCES Networks (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS AIInsights (
            id TEXT PRIMARY KEY,
            network_id TEXT NOT NULL,
            insight_text TEXT NOT NULL,
            category TEXT NOT NULL,
            is_locally_generated INTEGER DEFAULT 0,
            created_at TEXT NOT NULL,
            expires_at TEXT NOT NULL,
            FOREIGN KEY (network_id) REFERENCES Networks (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS UsageHistory (
            id TEXT PRIMARY KEY,
            device_id TEXT NOT NULL,
            network_id TEXT NOT NULL,
            download_bytes INTEGER NOT NULL,
            upload_bytes INTEGER NOT NULL,
            timestamp TEXT NOT NULL,
            FOREIGN KEY (device_id) REFERENCES Devices (id) ON DELETE CASCADE,
            FOREIGN KEY (network_id) REFERENCES Networks (id) ON DELETE CASCADE
          )
        ''');

        await db.execute('''
          CREATE TABLE IF NOT EXISTS FeatureFlags (
            key TEXT PRIMARY KEY,
            is_enabled INTEGER NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
        break;
      // Add future versions here
      default:
        AppLog().w('No migration script found for version $version');
    }
  }
}
