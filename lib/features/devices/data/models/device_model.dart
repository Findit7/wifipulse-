import '../../domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.id,
    required super.networkId,
    required super.macAddress,
    super.ipAddress,
    super.hostname,
    super.customName,
    super.vendor,
    required super.deviceType,
    super.osGuess,
    super.fingerprintHash,
    required super.isTrusted,
    required super.isOnline,
    required super.firstSeen,
    required super.lastSeen,
  });

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    return DeviceModel(
      id: map['id'] as String,
      networkId: map['network_id'] as String,
      macAddress: map['mac_address'] as String,
      ipAddress: map['ip_address'] as String?,
      hostname: map['hostname'] as String?,
      customName: map['custom_name'] as String?,
      vendor: map['vendor'] as String?,
      deviceType: map['device_type'] as String,
      osGuess: map['os_guess'] as String?,
      fingerprintHash: map['fingerprint_hash'] as String?,
      isTrusted: (map['is_trusted'] as int) == 1,
      isOnline: (map['is_online'] as int) == 1,
      firstSeen: DateTime.parse(map['first_seen'] as String),
      lastSeen: DateTime.parse(map['last_seen'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'network_id': networkId,
      'mac_address': macAddress,
      'ip_address': ipAddress,
      'hostname': hostname,
      'custom_name': customName,
      'vendor': vendor,
      'device_type': deviceType,
      'os_guess': osGuess,
      'fingerprint_hash': fingerprintHash,
      'is_trusted': isTrusted ? 1 : 0,
      'is_online': isOnline ? 1 : 0,
      'first_seen': firstSeen.toIso8601String(),
      'last_seen': lastSeen.toIso8601String(),
    };
  }

  factory DeviceModel.fromEntity(DeviceEntity entity) {
    return DeviceModel(
      id: entity.id,
      networkId: entity.networkId,
      macAddress: entity.macAddress,
      ipAddress: entity.ipAddress,
      hostname: entity.hostname,
      customName: entity.customName,
      vendor: entity.vendor,
      deviceType: entity.deviceType,
      osGuess: entity.osGuess,
      fingerprintHash: entity.fingerprintHash,
      isTrusted: entity.isTrusted,
      isOnline: entity.isOnline,
      firstSeen: entity.firstSeen,
      lastSeen: entity.lastSeen,
    );
  }
}
