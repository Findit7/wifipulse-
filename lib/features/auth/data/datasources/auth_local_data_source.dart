import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/database/base_local_data_source.dart';
import '../models/user_model.dart';
import '../../../../core/error/app_exception.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> clearUser();
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl extends BaseLocalDataSource
    implements AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  static const String _tokenKey = 'jwt_token';
  static const String _userCacheKey = 'cached_user';

  AuthLocalDataSourceImpl(Database super.database, this._secureStorage);

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      final db = database as Database;
      await db.insert(
        'Users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      await _secureStorage.write(
          key: _userCacheKey, value: jsonEncode(user.toMap()));
    } catch (e) {
      throw LocalDatabaseException('Failed to save user locally',
          originalError: e);
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      final cachedString = await _secureStorage.read(key: _userCacheKey);
      if (cachedString != null) {
        return UserModel.fromMap(jsonDecode(cachedString));
      }

      final db = database as Database;
      final List<Map<String, dynamic>> maps = await db.query('Users', limit: 1);
      if (maps.isNotEmpty) {
        final user = UserModel.fromMap(maps.first);
        await _secureStorage.write(
            key: _userCacheKey, value: jsonEncode(user.toMap()));
        return user;
      }
      return null;
    } catch (e) {
      throw LocalDatabaseException('Failed to get local user',
          originalError: e);
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      await (database as Database).delete('Users');
      await _secureStorage.delete(key: _userCacheKey);
    } catch (e) {
      throw LocalDatabaseException('Failed to clear user data',
          originalError: e);
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}
