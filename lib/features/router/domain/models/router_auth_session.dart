class RouterAuthSession {
  final String token;
  final DateTime expiresAt;

  const RouterAuthSession({
    required this.token,
    required this.expiresAt,
  });

  bool get isValid => DateTime.now().isBefore(expiresAt);
}
