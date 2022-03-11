import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_medium/app/controllers/home/home_controller.dart';
import 'package:todo_medium/app/models/task/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel taskModel;
  final dateFormat = DateFormat('dd/MM/y');
  final HomeController _homeController = Get.find();

  Task({Key? key, required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // BoxShadow(color: Colors.grey),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          // contentPadding: EdgeInsets.all(8),
          leading: Checkbox(
            value: taskModel.finished,
            onChanged: (value) {
              _homeController.checkOrUncheckTask(taskModel);
            },
          ),
          onTap: () {
            _homeController.editTask(taskModel.uuid);
          },
          title: Text(
            taskModel.description,
            style: TextStyle(
              decoration:
                  taskModel.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            dateFormat.format(taskModel.date),
            style: TextStyle(
              decoration:
                  taskModel.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   side: BorderSide(width: 1),
          // ),
        ),
      ),
    );
  }
}
