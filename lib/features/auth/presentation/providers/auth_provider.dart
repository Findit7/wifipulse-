import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/login_guest_usecase.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';

part 'auth_provider.g.dart';

enum AuthStateStatus { initial, loading, authenticated, guest, error }

class AuthState {
  final AuthStateStatus status;
  final UserEntity? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStateStatus.initial,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStateStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState();
  }

  Future<void> checkAuthStatus() async {
    state = state.copyWith(status: AuthStateStatus.loading);
    final result = await ref.read(getCurrentUserUseCaseProvider).execute();
    
    result.fold(
      (failure) => state = state.copyWith(status: AuthStateStatus.error, errorMessage: failure.message),
      (user) {
        if (user != null) {
          state = state.copyWith(
            status: user.isGuest ? AuthStateStatus.guest : AuthStateStatus.authenticated, 
            user: user
          );
        } else {
          state = state.copyWith(status: AuthStateStatus.initial, user: null);
        }
      },
    );
  }

  Future<void> loginAsGuest() async {
    state = state.copyWith(status: AuthStateStatus.loading);
    final result = await ref.read(loginGuestUseCaseProvider).execute();
    
    result.fold(
      (failure) => state = state.copyWith(status: AuthStateStatus.error, errorMessage: failure.message),
      (user) => state = state.copyWith(status: AuthStateStatus.guest, user: user),
    );
  }

  Future<void> loginWithEmail(String email, String password) async {
    state = state.copyWith(status: AuthStateStatus.loading);
    final result = await ref.read(loginWithEmailUseCaseProvider).execute(email, password);
    
    result.fold(
      (failure) => state = state.copyWith(status: AuthStateStatus.error, errorMessage: failure.message),
      (user) => state = state.copyWith(status: AuthStateStatus.authenticated, user: user),
    );
  }

  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(status: AuthStateStatus.loading);
    final result = await ref.read(registerUseCaseProvider).execute(name, email, password);
    
    result.fold(
      (failure) => state = state.copyWith(status: AuthStateStatus.error, errorMessage: failure.message),
      (user) => state = state.copyWith(status: AuthStateStatus.authenticated, user: user),
    );
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(status: AuthStateStatus.loading);
    final result = await ref.read(loginWithGoogleUseCaseProvider).execute();
    
    result.fold(
      (failure) => state = state.copyWith(status: AuthStateStatus.error, errorMessage: failure.message),
      (user) => state = state.copyWith(status: AuthStateStatus.authenticated, user: user),
    );
  }

  Future<void> logout() async {
    state = state.copyWith(status: AuthStateStatus.loading);
    final result = await ref.read(logoutUseCaseProvider).execute();
    
    result.fold(
      (failure) => state = state.copyWith(status: AuthStateStatus.error, errorMessage: failure.message),
      (_) => state = const AuthState(status: AuthStateStatus.initial, user: null),
    );
  }

  Future<void> completeOnboarding() async {
    state = state.copyWith(status: AuthStateStatus.loading);
    await ref.read(completeOnboardingUseCaseProvider).execute();
    await checkAuthStatus();
  }
}
