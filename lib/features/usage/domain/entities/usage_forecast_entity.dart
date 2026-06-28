class UsageForecastEntity {
  final String id;
  final String networkId;
  final double predictedBytes;
  final DateTime forDate;
  final DateTime generatedAt;

  const UsageForecastEntity({
    required this.id,
    required this.networkId,
    required this.predictedBytes,
    required this.forDate,
    required this.generatedAt,
  });
}
