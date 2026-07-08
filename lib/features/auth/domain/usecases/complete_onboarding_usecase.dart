import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/utils/result.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/di/repository_providers.dart';

part 'complete_onboarding_usecase.g.dart';

class CompleteOnboardingUseCase {
  final AuthRepository repository;
  CompleteOnboardingUseCase(this.repository);
  Future<Result<void>> execute() => repository.completeOnboarding();
}

@riverpod
CompleteOnboardingUseCase completeOnboardingUseCase(CompleteOnboardingUseCaseRef ref) {
  return CompleteOnboardingUseCase(ref.watch(authRepositoryProvider));
}
