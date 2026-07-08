import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/user_entity.dart';

part 'login_with_google_usecase.g.dart';

class LoginWithGoogleUseCase {
  final AuthRepository repository;
  LoginWithGoogleUseCase(this.repository);
  Future<Result<UserEntity>> execute() => repository.loginWithGoogle();
}

@riverpod
LoginWithGoogleUseCase loginWithGoogleUseCase(LoginWithGoogleUseCaseRef ref) {
  return LoginWithGoogleUseCase(ref.watch(authRepositoryProvider));
}
