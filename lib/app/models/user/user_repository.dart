import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<User?> register({required String email, required String password});
  Future<User?> loginEmail({required String email, required String password});
  Future<User?> loginGoogle();
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<void> updateDisplayName(String name);
  Future<void> updatePhotoURL(String photoUrl);
}
