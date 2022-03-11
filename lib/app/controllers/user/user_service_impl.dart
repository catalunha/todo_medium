import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_medium/app/controllers/user/user_service.dart';
import 'package:todo_medium/app/models/user/user_repository.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  UserServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;
  @override
  Future<User?> register({required String email, required String password}) =>
      _userRepository.register(email: email, password: password);

  @override
  Future<User?> loginEmail({required String email, required String password}) =>
      _userRepository.loginEmail(email: email, password: password);

  @override
  Future<void> forgotPassword(String email) =>
      _userRepository.forgotPassword(email);

  @override
  Future<User?> loginGoogle() => _userRepository.loginGoogle();

  @override
  Future<void> logout() => _userRepository.logout();

  @override
  Future<void> updateDisplayName(String name) =>
      _userRepository.updateDisplayName(name);

  @override
  Future<void> updatePhotoURL(String photoUrl) =>
      _userRepository.updatePhotoURL(photoUrl);
}
