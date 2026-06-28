import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/app_exception.dart';
import '../models/user_model.dart';
import 'package:uuid/uuid.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(String name, String email, String password);
  Future<UserModel> loginWithEmail(String email, String password);
  Future<UserModel> loginWithGoogle();
  Future<UserModel> loginAsGuest();
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserModel> register(String name, String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      return _mapFirebaseUser(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw ServerException('Registration failed: ${e.message}', code: e.code);
    } catch (e) {
      throw ServerException('Unexpected error during registration', originalError: e);
    }
  }

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _mapFirebaseUser(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw ServerException('Email login failed: ${e.message}', code: e.code);
    } catch (e) {
      throw ServerException('Unexpected error during email login', originalError: e);
    }
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      // NOTE: Google Sign In flow typically requires google_sign_in package handling credentials.
      // This is a simplified wrapper representing the Firebase connection.
      throw const ServerException('Google Sign In is not fully configured yet.', code: 'NOT_IMPLEMENTED');
    } catch (e) {
      throw ServerException('Unexpected error during Google login', originalError: e);
    }
  }

  @override
  Future<UserModel> loginAsGuest() async {
    return UserModel(
      id: const Uuid().v4(),
      name: 'Guest User',
      isGuest: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      hasCompletedOnboarding: false,
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  UserModel _mapFirebaseUser(User firebaseUser) {
    return UserModel(
      id: const Uuid().v4(), // In a real app, backend maps Firebase UID to internal UUID
      firebaseUid: firebaseUser.uid,
      name: firebaseUser.displayName ?? 'User',
      email: firebaseUser.email,
      isGuest: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      hasCompletedOnboarding: false,
    );
  }
}
