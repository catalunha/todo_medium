import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/home/home_controller.dart';
import 'package:todo_medium/app/controllers/mixins/message_mixin.dart';
import 'package:todo_medium/app/models/database/hive/hive_exception.dart';
import 'package:todo_medium/app/models/task/task_model.dart';
import 'package:todo_medium/app/models/task/task_repository.dart';
import 'package:todo_medium/app/models/task/task_respository_exception.dart';

class TaskCreateController extends GetxController {
  TaskRepository _taskRepository;
  TaskCreateController({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final _taskModel = Rxn<TaskModel>();
  TaskModel? get taskModel => _taskModel.value;

  var _selectedDate = DateTime.now().obs;
  DateTime? get selectedDate => _selectedDate.value;
  set selectedDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      _selectedDate.value = selectedDate;
    } else {
      _selectedDate.value = DateTime.now();
    }
  }

  @override
  void onInit() {
    super.onInit();
    TaskModel? model = Get.arguments;
    print('model: $model');
    if (model != null) {
      selectedDate = model.date;
    }
    _taskModel(model);
    print('_taskModel: ${_taskModel.value == null}');
  }

  Future<void> save(String description) async {
    try {
      _loading(true);
      DateTime date =
          DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day);
      if (_taskModel.value == null) {
        await _taskRepository.save(date: date, description: description);
      } else {
        TaskModel model =
            _taskModel.value!.copyWith(date: date, description: description);
        await _taskRepository.update(model.toMap());
      }
      final HomeController _homeController = Get.find();
      await _homeController.loadTasks(date);
      await _homeController.groupByDay();
    } on HiveBaseException catch (e) {
      _message.value = MessageModel(
        title: 'Erro em Hive',
        message: 'Nao foi possivel salvar a tarefa',
        isError: true,
      );
    } on TaskRespositoryException catch (e) {
      _message.value = MessageModel(
        title: 'Erro em Repository',
        message: 'Nao foi possivel salvar a tarefa',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }
}
