import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/home/home_controller.dart';
import 'package:todo_medium/app/views/home/part/task.dart';

class TaskList extends StatelessWidget {
  final HomeController _homeController = Get.find();
  TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Column(
                children: _homeController.allTasks
                    .map(
                      (task) => Task(taskModel: task),
                    )
                    .toList(),
              ))
        ],
      ),
    );
  }
}
