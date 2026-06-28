import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_exception.dart';
import '../repositories/auth_repository.dart';

class CompleteOnboardingUseCase {
  final AuthRepository _repository;

  CompleteOnboardingUseCase(this._repository);

  Future<Either<AppException, void>> execute() {
    return _repository.completeOnboarding();
  }
}
