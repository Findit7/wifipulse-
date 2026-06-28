import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailUseCase {
  final AuthRepository _repository;

  LoginWithEmailUseCase(this._repository);

  Future<Either<AppException, UserEntity>> execute(
      String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return Future.value(
          const Left(ServerException('Email and password cannot be empty.')));
    }
    return _repository.loginWithEmail(email, password);
  }
}
