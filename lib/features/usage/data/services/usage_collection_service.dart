import 'dart:async';
import 'dart:math';
import 'package:wifi_pulse/shared/database/app_database.dart';
import 'package:wifi_pulse/shared/database/daos/usage_analytics_dao.dart';
import 'package:uuid/uuid.dart';

class UsageDataCollectionService {
  final UsageAnalyticsDao _dao;
  Timer? _timer;
  final Random _random = Random();
  final _uuid = const Uuid();

  UsageDataCollectionService(this._dao);

  void startCollection() {
    if (_timer != null && _timer!.isActive) return;

    // Simulate collection every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      await _simulateDataCollection();
    });
  }

  void stopCollection() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _simulateDataCollection() async {
    // Generate realistic simulated bytes (e.g. browsing, streaming)
    // For demonstration, let's pretend there are 2 devices active
    final deviceIds = ['device-1-phone', 'device-2-tv'];
    
    for (final deviceId in deviceIds) {
      // Simulate 1MB to 10MB downloaded per 30 seconds
      final downloadBytes = _random.nextInt(9000000) + 1000000; 
      // Simulate 100KB to 1MB uploaded
      final uploadBytes = _random.nextInt(900000) + 100000;
      
      final entry = UsageAnalyticsCompanion.insert(
        id: _uuid.v4(),
        deviceId: deviceId,
        uploadBytes: uploadBytes,
        downloadBytes: downloadBytes,
        recordedAt: DateTime.now(),
        sessionDuration: const drift.Value(30000), // 30 seconds
        foregroundUsage: const drift.Value(15000), // 15 seconds
        wifiConnectionDuration: const drift.Value(30000),
      );

      await _dao.insertAnalytics(entry);
    }
  }
}
