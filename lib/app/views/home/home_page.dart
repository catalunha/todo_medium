import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/auth_controller.dart';
import 'package:todo_medium/app/controllers/home/home_controller.dart';
import 'package:todo_medium/app/routes.dart';
import 'package:todo_medium/app/views/core/ui/theme_config.dart';
import 'package:todo_medium/app/views/home/part/home_filters.dart';
import 'package:todo_medium/app/views/home/part/task_list.dart';
import 'package:todo_medium/app/views/home/part/pop_menu_photouser.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController = Get.find();
  AuthController _authController = Get.find();
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   widget._homeController.loadTasks();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá, ${widget._authController.user?.displayName ?? "Sem nome"}',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          PopMenuPhotoUser(),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              HomeFilters(),
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: IntrinsicHeight(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TaskList(),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () {
          // Get.toNamed(Routes.taskCreate);
          widget._homeController.addTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
