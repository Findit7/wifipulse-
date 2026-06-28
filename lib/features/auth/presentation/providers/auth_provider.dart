import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/login_guest_usecase.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';

import '../../../../core/di/repository_providers.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<UserEntity?> build() async {
    return null;
  }

  Future<void> checkAuthStatus() async {
    state = const AsyncLoading();
    final result = await ref.read(getCurrentUserUseCaseProvider).execute();
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (user) => state = AsyncData(user),
    );
  }

  Future<void> loginAsGuest() async {
    state = const AsyncLoading();
    final result = await ref.read(loginGuestUseCaseProvider).execute();
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (user) => state = AsyncData(user),
    );
  }

  Future<void> loginWithEmail(String email, String password) async {
    state = const AsyncLoading();
    final result = await ref.read(loginWithEmailUseCaseProvider).execute(email, password);
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (user) => state = AsyncData(user),
    );
  }

  Future<void> register(String name, String email, String password) async {
    state = const AsyncLoading();
    final result = await ref.read(registerUseCaseProvider).execute(name, email, password);
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (user) => state = AsyncData(user),
    );
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncLoading();
    final result = await ref.read(loginWithGoogleUseCaseProvider).execute();
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (user) => state = AsyncData(user),
    );
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await ref.read(logoutUseCaseProvider).execute();
    state = const AsyncData(null);
  }

  Future<void> completeOnboarding() async {
    await ref.read(completeOnboardingUseCaseProvider).execute();
    await checkAuthStatus();
  }
}
