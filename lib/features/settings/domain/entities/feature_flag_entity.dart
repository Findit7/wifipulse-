class FeatureFlagEntity {
  final String key;
  final bool isEnabled;
  final String? requiredVersion;

  const FeatureFlagEntity({
    required this.key,
    required this.isEnabled,
    this.requiredVersion,
  });
}
