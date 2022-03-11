import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/user/user_service.dart';
import 'package:todo_medium/app/routes.dart';

class AuthController extends GetxController {
  Rx<User?> _userFirebaseAuth = Rx<User?>(FirebaseAuth.instance.currentUser);
  User? get user => _userFirebaseAuth.value;

  final FirebaseAuth _firebaseAuth;
  final UserService _userService;
  AuthController({
    required FirebaseAuth firebaseAuth,
    required UserService userService,
  })  : _firebaseAuth = firebaseAuth,
        _userService = userService;

  @override
  onInit() {
    _userFirebaseAuth.bindStream(_firebaseAuth.authStateChanges());
    _userFirebaseAuth.bindStream(_firebaseAuth.userChanges());
    ever<User?>(_userFirebaseAuth, (user) async {
      if (user != null) {
        print('home');
        Get.offAllNamed(Routes.home);
      } else {
        print('login');
        Get.offAllNamed(Routes.authLogin);
      }
    });
    super.onInit();
  }

  Future<void> logout() => _userService.logout();
}
