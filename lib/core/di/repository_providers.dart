import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../network/dio_client.dart';
import '../database/database_helper.dart';

// Devices
import '../../features/devices/domain/repositories/device_repository.dart';
import '../../features/devices/data/repositories/device_repository_impl.dart';
import '../../features/devices/data/datasources/device_local_data_source.dart';

// Security
import '../../features/security/domain/repositories/security_repository.dart';
import '../../features/security/data/repositories/security_repository_impl.dart';
import '../../features/security/data/engines/security_audit_engine.dart';
import '../../features/security/data/datasources/security_local_data_source.dart';

// Insights
import '../../features/insights/domain/repositories/insight_repository.dart';
import '../../features/insights/data/repositories/insight_repository_impl.dart';
import '../../features/insights/data/engines/rule_based_insight_generator.dart';
import '../../features/insights/data/datasources/insight_local_data_source.dart';
import '../../features/insights/data/datasources/insight_remote_data_source.dart';

// Usage
import '../../features/usage/domain/repositories/usage_repository.dart';
import '../../features/usage/data/repositories/usage_repository_impl.dart';

// Dashboard
import '../../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';

// Discovery
import '../../features/discovery/domain/repositories/device_discovery_repository.dart';
import '../../features/discovery/data/repositories/device_discovery_repository_impl.dart';
import '../../features/discovery/data/services/vendor_lookup_service.dart';
import '../../features/discovery/data/services/classification_engine.dart';

// Router
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/router/domain/repositories/router_control_repository.dart';
import '../../features/router/data/repositories/router_control_repository_impl.dart';
import '../../features/router/data/services/router_discovery_engine.dart';

// Sync
import '../../features/sync/domain/repositories/sync_repository.dart';
import '../../features/sync/data/repositories/sync_repository_impl.dart';
import '../../features/sync/data/datasources/sync_local_data_source.dart';
import '../../features/sync/data/datasources/sync_remote_data_source.dart';

// Networks
import '../../features/networks/domain/repositories/network_repository.dart';
import '../../features/networks/data/repositories/network_repository_impl.dart';
import '../../features/networks/data/datasources/network_local_data_source.dart';

// Connectivity
import '../../shared/network/providers/network_providers.dart';

// Auth
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/mock_auth_remote_data_source.dart';
import '../../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../../features/auth/domain/usecases/login_guest_usecase.dart';
import '../../features/auth/domain/usecases/login_with_email_usecase.dart';
import '../../features/auth/domain/usecases/login_with_google_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/complete_onboarding_usecase.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    AuthLocalDataSourceImpl(ref.watch(databaseProvider).requireValue, const FlutterSecureStorage()),
    MockAuthRemoteDataSource(), // Using mock for now
    FirebaseAuth.instance, // Kept ready but unused by mock
  );
}

@Riverpod(keepAlive: true)
GetCurrentUserUseCase getCurrentUserUseCase(GetCurrentUserUseCaseRef ref) => GetCurrentUserUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
LoginGuestUseCase loginGuestUseCase(LoginGuestUseCaseRef ref) => LoginGuestUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
LoginWithEmailUseCase loginWithEmailUseCase(LoginWithEmailUseCaseRef ref) => LoginWithEmailUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
LoginWithGoogleUseCase loginWithGoogleUseCase(LoginWithGoogleUseCaseRef ref) => LoginWithGoogleUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
RegisterUseCase registerUseCase(RegisterUseCaseRef ref) => RegisterUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) => LogoutUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
CompleteOnboardingUseCase completeOnboardingUseCase(CompleteOnboardingUseCaseRef ref) => CompleteOnboardingUseCase(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
SyncRepository syncRepository(SyncRepositoryRef ref) {
  return SyncRepositoryImpl(
    SyncLocalDataSourceImpl(),
    SyncRemoteDataSourceImpl(ref.watch(dioClientProvider)),
  );
}



@Riverpod(keepAlive: true)
NetworkRepository networkRepository(NetworkRepositoryRef ref) {
  return NetworkRepositoryImpl(NetworkLocalDataSourceImpl(ref.watch(databaseProvider).requireValue));
}

@Riverpod(keepAlive: true)
DeviceDiscoveryRepository deviceDiscoveryRepository(DeviceDiscoveryRepositoryRef ref) {
  return DeviceDiscoveryRepositoryImpl(
    ref.watch(deviceRepositoryProvider),
    ref.watch(syncRepositoryProvider),
    VendorLookupService(),
    ClassificationEngine(),
  );
}

@Riverpod(keepAlive: true)
RouterControlRepository routerControlRepository(RouterControlRepositoryRef ref) {
  return RouterControlRepositoryImpl(
    RouterDiscoveryEngine(ref.watch(dioClientProvider)),
    const FlutterSecureStorage(),
  );
}

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(DeviceRepositoryRef ref) {
  return DeviceRepositoryImpl(DeviceLocalDataSourceImpl());
}

@Riverpod(keepAlive: true)
SecurityRepository securityRepository(SecurityRepositoryRef ref) {
  return SecurityRepositoryImpl(
    SecurityAuditEngine(),
    SecurityLocalDataSourceImpl(),
    securityAlertsEnabled: true,
  );
}

@Riverpod(keepAlive: true)
InsightRepository insightRepository(InsightRepositoryRef ref) {
  return InsightRepositoryImpl(
    InsightLocalDataSourceImpl(),
    InsightRemoteDataSourceImpl(ref.watch(dioClientProvider)),
    RuleBasedInsightGenerator(),
  );
}

@Riverpod(keepAlive: true)
UsageRepository usageRepository(UsageRepositoryRef ref) {
  return UsageRepositoryImpl(ref.watch(deviceRepositoryProvider));
}

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepositoryImpl(
    ref.watch(connectivityServiceProvider),
    ref.watch(wifiInfoServiceProvider),
  );
}
