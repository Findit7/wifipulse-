import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginGuestUseCase {
  final AuthRepository _repository;

  LoginGuestUseCase(this._repository);

  Future<Either<AppException, UserEntity>> execute() {
    return _repository.loginAsGuest();
  }
}
