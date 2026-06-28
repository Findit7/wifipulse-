import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/security_score_entity.dart';
import '../../domain/entities/alert_entity.dart';
import '../../domain/usecases/run_security_audit_usecase.dart';
import '../../domain/usecases/get_active_alerts_usecase.dart';
import '../../domain/usecases/resolve_alert_usecase.dart';
import '../../../../core/di/repository_providers.dart';

part 'security_provider.g.dart';

class SecurityState {
  final bool isAuditing;
  final SecurityScoreEntity? currentScore;
  final List<AlertEntity> activeAlerts;
  final String? error;

  const SecurityState({
    this.isAuditing = false,
    this.currentScore,
    this.activeAlerts = const [],
    this.error,
  });

  SecurityState copyWith({
    bool? isAuditing,
    SecurityScoreEntity? currentScore,
    List<AlertEntity>? activeAlerts,
    String? error,
  }) {
    return SecurityState(
      isAuditing: isAuditing ?? this.isAuditing,
      currentScore: currentScore ?? this.currentScore,
      activeAlerts: activeAlerts ?? this.activeAlerts,
      error: error,
    );
  }
}

@riverpod
RunSecurityAuditUseCase runSecurityAuditUseCase(RunSecurityAuditUseCaseRef ref) {
  return RunSecurityAuditUseCase(
    ref.watch(securityRepositoryProvider),
    ref.watch(deviceRepositoryProvider), // Injected after Phase 5 refactor
  );
}

@riverpod
GetActiveAlertsUseCase getActiveAlertsUseCase(GetActiveAlertsUseCaseRef ref) {
  return GetActiveAlertsUseCase(ref.watch(securityRepositoryProvider));
}

@riverpod
ResolveAlertUseCase resolveAlertUseCase(ResolveAlertUseCaseRef ref) {
  return ResolveAlertUseCase(
    ref.watch(securityRepositoryProvider),
    ref.watch(syncRepositoryProvider),
  );
}

@riverpod
class SecurityController extends _$SecurityController {
  @override
  SecurityState build() {
    return const SecurityState();
  }

  Future<void> performAudit(String networkId) async {
    state = state.copyWith(isAuditing: true, error: null);

    final auditUseCase = ref.read(runSecurityAuditUseCaseProvider);
    final alertsUseCase = ref.read(getActiveAlertsUseCaseProvider);

    final auditResult = await auditUseCase.execute(networkId);
    
    auditResult.fold(
      (error) => state = state.copyWith(isAuditing: false, error: error.message),
      (score) async {
        final alertsResult = await alertsUseCase.execute(networkId);
        final alerts = alertsResult.getOrElse((_) => []);
        
        state = state.copyWith(
          isAuditing: false, 
          currentScore: score,
          activeAlerts: alerts,
        );
      },
    );
  }

  Future<void> resolveAlert(String alertId, String networkId) async {
    final useCase = ref.read(resolveAlertUseCaseProvider);
    final result = await useCase.execute(alertId);
    
    result.fold(
      (error) => state = state.copyWith(error: error.message),
      (_) async {
        final alertsUseCase = ref.read(getActiveAlertsUseCaseProvider);
        final alertsResult = await alertsUseCase.execute(networkId);
        state = state.copyWith(
          activeAlerts: alertsResult.getOrElse((_) => []),
        );
      },
    );
  }
}
