import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';
import '../entities/user_entity.dart';

part 'get_current_user_usecase.g.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;
  GetCurrentUserUseCase(this.repository);
  Future<Result<UserEntity?>> execute() => repository.getCurrentUser();
}

@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(GetCurrentUserUseCaseRef ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
}
