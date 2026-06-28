class RouterEntity {
  final String id;
  final String networkId;
  final String vendor;
  final String? model;
  final String gatewayIp;
  final String adminUsername;
  final String adminPassword;
  final Map<String, dynamic>? capabilities;

  const RouterEntity({
    required this.id,
    required this.networkId,
    required this.vendor,
    this.model,
    required this.gatewayIp,
    required this.adminUsername,
    required this.adminPassword,
    this.capabilities,
  });
}
