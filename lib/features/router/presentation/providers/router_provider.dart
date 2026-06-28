import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/adapters/i_router_adapter.dart';
import '../../domain/models/router_auth_session.dart';
import '../../domain/usecases/detect_router_usecase.dart';
import '../../domain/usecases/authenticate_router_usecase.dart';
import '../../../../core/di/repository_providers.dart';

part 'router_provider.g.dart';

enum RouterUIState {
  initial,
  detecting,
  routerDetected,
  routerUnsupported,
  authRequired,
  authFailed,
  routerConnected,
}

class RouterState {
  final RouterUIState uiState;
  final IRouterAdapter? activeAdapter;
  final RouterAuthSession? activeSession;
  final String? error;

  const RouterState({
    this.uiState = RouterUIState.initial,
    this.activeAdapter,
    this.activeSession,
    this.error,
  });

  RouterState copyWith({
    RouterUIState? uiState,
    IRouterAdapter? activeAdapter,
    RouterAuthSession? activeSession,
    String? error,
  }) {
    return RouterState(
      uiState: uiState ?? this.uiState,
      activeAdapter: activeAdapter ?? this.activeAdapter,
      activeSession: activeSession ?? this.activeSession,
      error: error,
    );
  }
}

@riverpod
DetectRouterUseCase detectRouterUseCase(DetectRouterUseCaseRef ref) {
  return DetectRouterUseCase(ref.watch(routerControlRepositoryProvider));
}

@riverpod
AuthenticateRouterUseCase authenticateRouterUseCase(AuthenticateRouterUseCaseRef ref) {
  return AuthenticateRouterUseCase(ref.watch(routerControlRepositoryProvider));
}

@riverpod
class RouterController extends _$RouterController {
  @override
  RouterState build() {
    return const RouterState();
  }

  Future<void> detectRouter(String gatewayIp, {String? gatewayMac}) async {
    state = state.copyWith(uiState: RouterUIState.detecting, error: null);

    final useCase = ref.read(detectRouterUseCaseProvider);
    final result = await useCase.execute(gatewayIp, gatewayMac);

    result.fold(
      (error) => state = state.copyWith(uiState: RouterUIState.initial, error: error.message),
      (adapter) {
        if (adapter.vendor == 'Generic') {
          state = state.copyWith(uiState: RouterUIState.routerUnsupported, activeAdapter: adapter);
        } else {
          state = state.copyWith(uiState: RouterUIState.authRequired, activeAdapter: adapter);
        }
      },
    );
  }

  Future<void> authenticate(String username, String password) async {
    final adapter = state.activeAdapter;
    if (adapter == null) return;

    state = state.copyWith(error: null);

    final useCase = ref.read(authenticateRouterUseCaseProvider);
    final result = await useCase.execute(adapter, username, password);

    result.fold(
      (error) => state = state.copyWith(uiState: RouterUIState.authFailed, error: error.message),
      (session) => state = state.copyWith(uiState: RouterUIState.routerConnected, activeSession: session),
    );
  }
}
