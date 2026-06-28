import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<AppException, UserEntity>> loginWithEmail(String email, String password);
  Future<Either<AppException, UserEntity>> register(String name, String email, String password);
  Future<Either<AppException, UserEntity>> loginWithGoogle();
  Future<Either<AppException, UserEntity>> loginAsGuest();
  Future<Either<AppException, void>> logout();
  Future<Either<AppException, UserEntity?>> getCurrentUser();
  Future<Either<AppException, void>> completeOnboarding();
}
