import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/utils/result.dart';
import '../../../../shared/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._localDataSource, this._remoteDataSource, this._firebaseAuth);

  @override
  Future<Result<UserEntity>> register(String name, String email, String password) async {
    try {
      final userModel = await _remoteDataSource.register(name, email, password);
      await _localDataSource.saveUser(userModel);
      
      final token = await _firebaseAuth.currentUser?.getIdToken();
      if (token != null) {
        await _localDataSource.saveToken(token);
      }
      return Right(userModel);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> loginWithEmail(String email, String password) async {
    try {
      final userModel = await _remoteDataSource.loginWithEmail(email, password);
      await _localDataSource.saveUser(userModel);
      
      final token = await _firebaseAuth.currentUser?.getIdToken();
      if (token != null) {
        await _localDataSource.saveToken(token);
      }
      return Right(userModel);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> loginWithGoogle() async {
    try {
      final userModel = await _remoteDataSource.loginWithGoogle();
      await _localDataSource.saveUser(userModel);
      return Right(userModel);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity>> loginAsGuest() async {
    try {
      final userModel = await _remoteDataSource.loginAsGuest();
      await _localDataSource.saveUser(userModel);
      return Right(userModel);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _localDataSource.clearUser();
      await _localDataSource.clearToken();
      return const Right(null);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity?>> getCurrentUser() async {
    try {
      final user = await _localDataSource.getUser();
      return Right(user);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> completeOnboarding() async {
    try {
      final user = await _localDataSource.getUser();
      if (user != null) {
        final updatedUser = user.copyWith(hasCompletedOnboarding: true);
        await _localDataSource.saveUser(UserModel.fromEntity(updatedUser));
      }
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
