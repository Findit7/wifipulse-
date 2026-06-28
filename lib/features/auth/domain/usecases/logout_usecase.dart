import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<Either<AppException, void>> execute() {
    return _repository.logout();
  }
}
