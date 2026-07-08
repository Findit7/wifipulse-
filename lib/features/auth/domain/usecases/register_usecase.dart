import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/user_entity.dart';

part 'register_usecase.g.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);
  Future<Result<UserEntity>> execute(String name, String email, String password) => repository.register(name, email, password);
}

@riverpod
RegisterUseCase registerUseCase(RegisterUseCaseRef ref) {
  return RegisterUseCase(ref.watch(authRepositoryProvider));
}
