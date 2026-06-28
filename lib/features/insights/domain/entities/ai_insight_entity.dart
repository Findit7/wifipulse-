class AIInsightEntity {
  final String id;
  final String networkId;
  final String insightText;
  final String category; // 'Usage', 'Security', 'Performance'
  final DateTime createdAt;
  final DateTime expiresAt;
  final bool isLocallyGenerated; 

  const AIInsightEntity({
    required this.id,
    required this.networkId,
    required this.insightText,
    required this.category,
    required this.createdAt,
    required this.expiresAt,
    this.isLocallyGenerated = false,
  });
}
