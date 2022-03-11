import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/task/create/task_create_controller.dart';
import 'package:todo_medium/app/views/core/ui/theme_config.dart';
import 'package:todo_medium/app/views/core/widget/todo_list_field.dart';
import 'package:todo_medium/app/views/task/create/part/calendar_button.dart';
import 'package:validatorless/validatorless.dart';

class TaskCreatePage extends StatefulWidget {
  final TaskCreateController _taskCreateController = Get.find();

  TaskCreatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  final _descriptionTec = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _descriptionTec.text =
        widget._taskCreateController.taskModel?.description ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionTec.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${widget._taskCreateController.taskModel == null ? "Criar" : "Editar"} task',
                  style: context.titleStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TodoListField(
                label: '',
                controller: _descriptionTec,
                validator: Validatorless.required('Descrição obrigatória'),
              ),
              SizedBox(height: 20),
              CalendarButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.primaryColor,
        onPressed: () async {
          final formValid = _formKey.currentState?.validate() ?? false;
          if (formValid) {
            await widget._taskCreateController.save(_descriptionTec.text);
            Get.back();
          }
        },
        label: Text(
          'Salvar task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
