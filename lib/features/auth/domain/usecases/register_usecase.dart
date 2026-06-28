import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<AppException, UserEntity>> execute(String name, String email, String password) {
    return _repository.register(name, email, password);
  }
}
