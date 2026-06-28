import 'package:workmanager/workmanager.dart';
import '../utils/logger.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    AppLog().i('Background Sync Task Triggered: $task');
    
    try {
      // 1. Initialize DB and DI
      // 2. Resolve ProcessSyncQueueUseCase
      // 3. Execute batch sync
      
      AppLog().i('Background Sync Task Completed');
      return Future.value(true);
    } catch (e) {
      AppLog().e('Background Sync Task Failed', e);
      // Return false to trigger exponential backoff retry via Workmanager
      return Future.value(false);
    }
  });
}

class SyncWorkerConfig {
  static const String _syncTask = "com.wifipulse.syncTask";

  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true, // Disable in prod
    );
  }

  static void registerPeriodicSync() {
    Workmanager().registerPeriodicTask(
      "wifi_pulse_sync_1",
      _syncTask,
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected, // Connectivity-Aware constraint
        requiresBatteryNotLow: true,
      ),
      backoffPolicy: BackoffPolicy.exponential,
      backoffPolicyDelay: const Duration(minutes: 5),
    );
  }
}
