class UserEntity {
  final String id; // UUID
  final String? firebaseUid;
  final String name;
  final String? email;
  final bool isGuest;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool hasCompletedOnboarding;

  const UserEntity({
    required this.id,
    this.firebaseUid,
    required this.name,
    this.email,
    required this.isGuest,
    required this.createdAt,
    required this.updatedAt,
    this.hasCompletedOnboarding = false,
  });

  UserEntity copyWith({
    String? id,
    String? firebaseUid,
    String? name,
    String? email,
    bool? isGuest,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? hasCompletedOnboarding,
  }) {
    return UserEntity(
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      name: name ?? this.name,
      email: email ?? this.email,
      isGuest: isGuest ?? this.isGuest,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      hasCompletedOnboarding: hasCompletedOnboarding ?? this.hasCompletedOnboarding,
    );
  }
}
