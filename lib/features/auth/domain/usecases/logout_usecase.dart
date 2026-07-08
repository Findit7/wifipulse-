import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';

part 'logout_usecase.g.dart';

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);
  Future<Result<void>> execute() => repository.logout();
}

@riverpod
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
}
