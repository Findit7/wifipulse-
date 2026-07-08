import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/user_entity.dart';

part 'login_with_email_usecase.g.dart';

class LoginWithEmailUseCase {
  final AuthRepository repository;
  LoginWithEmailUseCase(this.repository);
  Future<Result<UserEntity>> execute(String email, String password) => repository.loginWithEmail(email, password);
}

@riverpod
LoginWithEmailUseCase loginWithEmailUseCase(LoginWithEmailUseCaseRef ref) {
  return LoginWithEmailUseCase(ref.watch(authRepositoryProvider));
}
