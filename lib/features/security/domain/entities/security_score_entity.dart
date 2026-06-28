class SecurityScoreEntity {
  final String id;
  final String networkId;
  final int overallScore;
  final String? encryptionType;
  final Map<String, dynamic> openPortsDetected;
  final int untrustedDevicesCount;
  final DateTime timestamp;

  // Additional transient properties for UI mapping
  final String riskLevel;
  final List<String> passedChecks;
  final List<String> failedChecks;
  final List<String> unsupportedChecks;

  const SecurityScoreEntity({
    required this.id,
    required this.networkId,
    required this.overallScore,
    this.encryptionType,
    required this.openPortsDetected,
    required this.untrustedDevicesCount,
    required this.timestamp,
    required this.riskLevel,
    this.passedChecks = const [],
    this.failedChecks = const [],
    this.unsupportedChecks = const [],
  });
}
