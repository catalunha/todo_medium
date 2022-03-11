import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/task/create/task_create_controller.dart';
import 'package:todo_medium/app/controllers/task/task_service.dart';
import 'package:todo_medium/app/controllers/task/task_service_impl.dart';
import 'package:todo_medium/app/models/task/task_repository.dart';
import 'package:todo_medium/app/models/task/task_repository_impl.dart';

class TaskCreateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskCreateController>(
        () => TaskCreateController(taskRepository: Get.find()));
  }
}
