import '../../../shared/utils/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> loginWithEmail(String email, String password);
  Future<Result<UserEntity>> register(String name, String email, String password);
  Future<Result<UserEntity>> loginWithGoogle();
  Future<Result<UserEntity>> loginAsGuest();
  Future<Result<void>> logout();
  Future<Result<UserEntity?>> getCurrentUser();
  Future<Result<void>> completeOnboarding();
}
