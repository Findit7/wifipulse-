import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/process_sync_queue_usecase.dart';
import '../../../../core/network/connectivity_service.dart';
import '../../../../core/utils/logger.dart';

part 'sync_provider.g.dart';

@Riverpod(keepAlive: true)
class SyncCoordinator extends _$SyncCoordinator {
  late final ProcessSyncQueueUseCase _processSyncQueueUseCase;
  late final IConnectivityService _connectivityService;

  @override
  bool build() {
    return false; // represents isSyncing state
  }

  void initDependencies({
    required ProcessSyncQueueUseCase processSyncQueueUseCase,
    required IConnectivityService connectivityService,
  }) {
    _processSyncQueueUseCase = processSyncQueueUseCase;
    _connectivityService = connectivityService;

    // Connectivity-Aware Sync: Listen for restoration
    _connectivityService.isConnectedStream.listen((isConnected) {
      if (isConnected && !state) {
        AppLog().i('Connectivity restored. Triggering opportunistic sync.');
        triggerSync();
      }
    });
  }

  Future<void> triggerSync() async {
    if (state) return; // Prevent concurrent syncs
    
    final canSync = await _connectivityService.isSyncAvailable();
    if (!canSync) {
      AppLog().d('Sync aborted: No internet reachability.');
      return;
    }

    state = true;
    final result = await _processSyncQueueUseCase.execute();
    state = false;
    
    result.fold(
      (error) => AppLog().e('Sync Coordinator encountered error', error),
      (_) => AppLog().i('Sync Coordinator finished batch successfully'),
    );
  }
}
