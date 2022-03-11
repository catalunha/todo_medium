import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/auth_controller.dart';
import 'package:todo_medium/app/controllers/user/user_service.dart';
import 'package:todo_medium/app/controllers/user/user_service_impl.dart';
import 'package:todo_medium/app/models/user/user_repository.dart';
import 'package:todo_medium/app/models/user/user_repository_impl.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuth>(
      FirebaseAuth.instance,
      permanent: true,
    );
    Get.put<UserRepository>(
        UserRepositoryImpl(
          firebaseAuth: Get.find(),
        ),
        permanent: true);
    Get.put<UserService>(
        UserServiceImpl(
          userRepository: Get.find(),
        ),
        permanent: true);
    Get.put<AuthController>(
      AuthController(
        firebaseAuth: Get.find(),
        userService: Get.find(),
      ),
      permanent: true,
    );
  }
}
