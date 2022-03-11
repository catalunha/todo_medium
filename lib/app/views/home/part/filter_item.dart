import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/home/home_controller.dart';
import 'package:todo_medium/app/models/task/group_tasks_model.dart';
import 'package:todo_medium/app/views/core/ui/theme_config.dart';

class FilterItem extends StatelessWidget {
  final HomeController _homeController = Get.find();

  final GroupTasksModel groupTasksModel;
  FilterItem({Key? key, required this.groupTasksModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _homeController.loadTasks(DateTime.parse(groupTasksModel.date));
      },
      borderRadius: BorderRadius.circular(30),
      child: Obx(() => Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _homeController.groupDate.value == groupTasksModel.date
                  ? context.primaryColor
                  : context.primaryColor.withAlpha(70),
              border: Border.all(
                width: 1,
                color: Colors.grey.withOpacity(0.8),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(children: [
              Text(groupTasksModel.date),
              Text(
                  '${groupTasksModel.notFinished} / ${groupTasksModel.finished}'),
            ]),
          )),
    );
  }
}
