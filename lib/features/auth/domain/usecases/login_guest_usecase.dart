import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/user_entity.dart';

part 'login_guest_usecase.g.dart';

class LoginGuestUseCase {
  final AuthRepository repository;
  LoginGuestUseCase(this.repository);
  Future<Result<UserEntity>> execute() => repository.loginAsGuest();
}

@riverpod
LoginGuestUseCase loginGuestUseCase(LoginGuestUseCaseRef ref) {
  return LoginGuestUseCase(ref.watch(authRepositoryProvider));
}
