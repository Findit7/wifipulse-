import 'dart:async';
import 'package:uuid/uuid.dart';
import '../../../../core/error/app_exception.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  final Map<String, String> _users = {}; // email -> password
  UserModel? _currentUser;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_users.containsKey(email)) {
      throw const ServerException('User already exists');
    }
    _users[email] = password;
    
    _currentUser = UserModel(
      id: const Uuid().v4(),
      firebaseUid: 'mock_uid_${email}',
      name: name,
      email: email,
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      hasCompletedOnboarding: false,
    );
    return _currentUser!;
  }

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_users[email] != password) {
      throw const ServerException('Invalid credentials');
    }
    _currentUser = UserModel(
      id: const Uuid().v4(),
      firebaseUid: 'mock_uid_${email}',
      name: email.split('@')[0],
      email: email,
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      hasCompletedOnboarding: false,
    );
    return _currentUser!;
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = UserModel(
      id: const Uuid().v4(),
      firebaseUid: 'mock_google_uid',
      name: 'Google User',
      email: 'user@gmail.com',
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      hasCompletedOnboarding: false,
    );
    return _currentUser!;
  }

  @override
  Future<UserModel> loginAsGuest() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = UserModel(
      id: const Uuid().v4(),
      name: 'Guest User',
      isGuest: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      hasCompletedOnboarding: false,
    );
    return _currentUser!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }
}
