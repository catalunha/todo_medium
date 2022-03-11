import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(userService: Get.find()));
  }
}
