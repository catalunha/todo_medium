import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/auth_binding.dart';
import 'package:todo_medium/app/controllers/auth/login/login_binding.dart';
import 'package:todo_medium/app/controllers/auth/register/register_binding.dart';
import 'package:todo_medium/app/controllers/home/home_binding.dart';
import 'package:todo_medium/app/controllers/task/create/task_create_binding.dart';
import 'package:todo_medium/app/views/auth/login/login_page.dart';
import 'package:todo_medium/app/views/auth/register/register_page.dart';
import 'package:todo_medium/app/views/home/home_page.dart';
import 'package:todo_medium/app/views/splash/splash_page.dart';
import 'package:todo_medium/app/views/task/create/task_create_page.dart';

class Routes {
  static const splash = '/';
  static const authRegister = '/auth/register';
  static const authLogin = '/auth/login';
  static const home = '/home';
  static const taskCreate = '/task/create';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: AuthBinding(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.authLogin,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.authRegister,
      binding: RegisterBinding(),
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.taskCreate,
      binding: TaskCreateBinding(),
      page: () => TaskCreatePage(),
    ),
  ];
}
