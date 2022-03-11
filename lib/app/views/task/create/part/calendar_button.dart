import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_medium/app/controllers/task/create/task_create_controller.dart';
import 'package:todo_medium/app/views/core/ui/theme_config.dart';

class CalendarButton extends StatelessWidget {
  final TaskCreateController _controller = Get.find();
  final dateFormat = DateFormat('dd/MM/y');

  CalendarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = _controller.taskModel?.date ?? DateTime.now();
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: _controller.selectedDate!,
          firstDate: DateTime(lastDate.year),
          lastDate: DateTime(lastDate.year + 1),
        );
        _controller.selectedDate = selectedDate;
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.today,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Obx(() {
              if (_controller.selectedDate != null) {
                return Text(dateFormat.format(_controller.selectedDate!),
                    style: context.titleStyle);
              } else {
                return Text('Selecione uma data', style: context.titleStyle);
              }
            }),
          ],
        ),
      ),
    );
  }
}
