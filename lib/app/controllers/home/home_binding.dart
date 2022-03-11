import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/home/home_controller.dart';
import 'package:todo_medium/app/controllers/task/task_service.dart';
import 'package:todo_medium/app/controllers/task/task_service_impl.dart';
import 'package:todo_medium/app/models/database/hive/hive_connection_factory.dart';
import 'package:todo_medium/app/models/task/task_repository.dart';
import 'package:todo_medium/app/models/task/task_repository_impl.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HiveConnectionFactory>(HiveConnectionFactory(), permanent: true);
    Get.lazyPut<TaskRepository>(
        () => TaskRepositoryImp(hiveConnectionFactory: Get.find()));
    Get.lazyPut<TaskService>(() => TaskServiceImp(taskRepository: Get.find()));

    Get.lazyPut<HomeController>(() => HomeController(taskService: Get.find()));
  }
}
