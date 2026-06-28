import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    super.firebaseUid,
    required super.name,
    super.email,
    required super.isGuest,
    required super.createdAt,
    required super.updatedAt,
    super.hasCompletedOnboarding,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      firebaseUid: map['firebase_uid'] as String?,
      name: map['name'] as String,
      email: map['email'] as String?,
      isGuest: (map['is_guest'] as int) == 1,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      hasCompletedOnboarding: (map['has_completed_onboarding'] as int?) == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firebase_uid': firebaseUid,
      'name': name,
      'email': email,
      'is_guest': isGuest ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'has_completed_onboarding': hasCompletedOnboarding ? 1 : 0,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      firebaseUid: entity.firebaseUid,
      name: entity.name,
      email: entity.email,
      isGuest: entity.isGuest,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      hasCompletedOnboarding: entity.hasCompletedOnboarding,
    );
  }
}
