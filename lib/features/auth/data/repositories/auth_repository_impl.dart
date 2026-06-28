import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/error_handler.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._localDataSource, this._remoteDataSource, this._firebaseAuth);

  @override
  Future<Either<AppException, UserEntity>> register(String name, String email, String password) async {
    return ErrorHandler.execute(() async {
      final userModel = await _remoteDataSource.register(name, email, password);
      await _localDataSource.saveUser(userModel);
      
      final token = await _firebaseAuth.currentUser?.getIdToken();
      if (token != null) {
        await _localDataSource.saveToken(token);
      }
      return userModel;
    });
  }

  @override
  Future<Either<AppException, UserEntity>> loginWithEmail(String email, String password) async {
    return ErrorHandler.execute(() async {
      final userModel = await _remoteDataSource.loginWithEmail(email, password);
      await _localDataSource.saveUser(userModel);
      
      final token = await _firebaseAuth.currentUser?.getIdToken();
      if (token != null) {
        await _localDataSource.saveToken(token);
      }
      return userModel;
    });
  }

  @override
  Future<Either<AppException, UserEntity>> loginWithGoogle() async {
    return ErrorHandler.execute(() async {
      final userModel = await _remoteDataSource.loginWithGoogle();
      await _localDataSource.saveUser(userModel);
      return userModel;
    });
  }

  @override
  Future<Either<AppException, UserEntity>> loginAsGuest() async {
    return ErrorHandler.execute(() async {
      final userModel = await _remoteDataSource.loginAsGuest();
      await _localDataSource.saveUser(userModel);
      return userModel;
    });
  }

  @override
  Future<Either<AppException, void>> logout() async {
    return ErrorHandler.execute(() async {
      await _remoteDataSource.logout();
      await _localDataSource.clearUser();
      await _localDataSource.clearToken();
    });
  }

  @override
  Future<Either<AppException, UserEntity?>> getCurrentUser() async {
    return ErrorHandler.execute(() async {
      return await _localDataSource.getUser();
    });
  }

  @override
  Future<Either<AppException, void>> completeOnboarding() async {
    return ErrorHandler.execute(() async {
      final user = await _localDataSource.getUser();
      if (user != null) {
        final updatedUser = user.copyWith(hasCompletedOnboarding: true);
        await _localDataSource.saveUser(UserModel.fromEntity(updatedUser));
      }
    });
  }
}
