class DeviceEntity {
  final String id;
  final String networkId;
  final String macAddress;
  final String? ipAddress;
  final String? hostname;
  final String? customName;
  final String? vendor;
  final String deviceType;
  final String? osGuess;
  final String? fingerprintHash;
  final bool isTrusted;
  final bool isOnline;
  final DateTime firstSeen;
  final DateTime lastSeen;

  const DeviceEntity({
    required this.id,
    required this.networkId,
    required this.macAddress,
    this.ipAddress,
    this.hostname,
    this.customName,
    this.vendor,
    required this.deviceType,
    this.osGuess,
    this.fingerprintHash,
    required this.isTrusted,
    required this.isOnline,
    required this.firstSeen,
    required this.lastSeen,
  });
}
