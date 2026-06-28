import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import '../../domain/entities/alert_entity.dart';
import '../../domain/entities/security_score_entity.dart';
import '../../../../core/database/database_helper.dart';

abstract class SecurityLocalDataSource {
  Future<void> saveSecurityScore(SecurityScoreEntity score);
  Future<List<SecurityScoreEntity>> getSecurityScores(String networkId);
  Future<void> saveAlerts(List<AlertEntity> alerts);
  Future<List<AlertEntity>> getUnreadAlerts(String networkId);
  Future<void> markAlertAsRead(String alertId);
}

class SecurityLocalDataSourceImpl implements SecurityLocalDataSource {
  @override
  Future<void> saveSecurityScore(SecurityScoreEntity score) async {
    final db = await DatabaseHelper.init();
    await db.insert(
      'SecurityScores',
      {
        'id': score.id,
        'network_id': score.networkId,
        'overall_score': score.overallScore,
        'encryption_type': score.encryptionType ?? '',
        'open_ports_detected': jsonEncode(score.openPortsDetected),
        'untrusted_devices_count': score.untrustedDevicesCount,
        'timestamp': score.timestamp.toIso8601String(),
        'risk_level': score.riskLevel,
        'passed_checks': jsonEncode(score.passedChecks),
        'failed_checks': jsonEncode(score.failedChecks),
        'unsupported_checks': jsonEncode(score.unsupportedChecks),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<SecurityScoreEntity>> getSecurityScores(String networkId) async {
    final db = await DatabaseHelper.init();
    final maps = await db.query(
      'SecurityScores',
      where: 'network_id = ?',
      whereArgs: [networkId],
      orderBy: 'timestamp DESC',
    );

    return maps.map((map) => SecurityScoreEntity(
      id: map['id'] as String,
      networkId: map['network_id'] as String,
      overallScore: map['overall_score'] as int,
      encryptionType: map['encryption_type'] == '' ? null : map['encryption_type'] as String,
      openPortsDetected: jsonDecode(map['open_ports_detected'] as String),
      untrustedDevicesCount: map['untrusted_devices_count'] as int,
      timestamp: DateTime.parse(map['timestamp'] as String),
      riskLevel: map['risk_level'] as String,
      passedChecks: List<String>.from(jsonDecode(map['passed_checks'] as String)),
      failedChecks: List<String>.from(jsonDecode(map['failed_checks'] as String)),
      unsupportedChecks: List<String>.from(jsonDecode(map['unsupported_checks'] as String)),
    )).toList();
  }

  @override
  Future<void> saveAlerts(List<AlertEntity> alerts) async {
    final db = await DatabaseHelper.init();
    final batch = db.batch();
    for (var alert in alerts) {
      batch.insert(
        'Alerts',
        {
          'id': alert.id,
          'network_id': alert.networkId,
          'type': alert.type,
          'title': alert.title,
          'message': alert.message,
          'is_read': alert.isRead ? 1 : 0,
          'created_at': alert.createdAt.toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<List<AlertEntity>> getUnreadAlerts(String networkId) async {
    final db = await DatabaseHelper.init();
    final maps = await db.query(
      'Alerts',
      where: 'network_id = ? AND is_read = 0',
      whereArgs: [networkId],
      orderBy: 'created_at DESC',
    );

    return maps.map((map) => AlertEntity(
      id: map['id'] as String,
      networkId: map['network_id'] as String,
      type: map['type'] as String,
      title: map['title'] as String,
      message: map['message'] as String,
      isRead: (map['is_read'] as int) == 1,
      createdAt: DateTime.parse(map['created_at'] as String),
    )).toList();
  }

  @override
  Future<void> markAlertAsRead(String alertId) async {
    final db = await DatabaseHelper.init();
    await db.update(
      'Alerts',
      {'is_read': 1},
      where: 'id = ?',
      whereArgs: [alertId],
    );
  }
}
