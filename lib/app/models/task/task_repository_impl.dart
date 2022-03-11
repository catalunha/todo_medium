import 'package:todo_medium/app/controllers/task/task_service.dart';
import 'package:todo_medium/app/models/database/hive/hive_connection_factory.dart';
import 'package:todo_medium/app/models/database/hive/hive_exception.dart';
import 'package:todo_medium/app/models/task/task_model.dart';
import 'package:todo_medium/app/models/task/task_repository.dart';

class TaskRepositoryImp implements TaskRepository {
  final HiveConnectionFactory _hiveConnectionFactory;
  TaskRepositoryImp({
    required HiveConnectionFactory hiveConnectionFactory,
  }) : _hiveConnectionFactory = hiveConnectionFactory;

  @override
  Future<void> save(
      {required DateTime date, required String description}) async {
    final conn = await _hiveConnectionFactory.openConnection();
    try {
      await conn.create(
          boxName: 'todo',
          data: {'date': date, 'description': description, 'finished': false});
    } finally {
      _hiveConnectionFactory.closeConnection();
    }
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel task) async {
    final conn = await _hiveConnectionFactory.openConnection();
    await conn.update(boxName: 'todo', data: task.toMap());
  }

  @override
  Future<void> clearAll() async {
    final conn = await _hiveConnectionFactory.openConnection();
    await conn.deleteAll('todo');
  }

  @override
  Future<List<TaskModel>> findByPeriod(
      {required DateTime start, DateTime? end}) async {
    final startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    DateTime endFilter;
    if (end == null) {
      endFilter = DateTime(start.year, start.month, start.day, 23, 59, 59);
    } else {
      endFilter = DateTime(end.year, end.month, end.day, 23, 59, 59);
    }
    final conn = await _hiveConnectionFactory.openConnection();
    final resultTasksMap = await conn.readAll('todo');
    //print('findByPeriod');
    //print(resultTasksMap);
    final resultTasksModel =
        resultTasksMap.map((e) => TaskModel.fromMap(e)).toList();
    var filtered = <TaskModel>[];
    for (var task in resultTasksModel) {
      //print(task);
      if (task.date.isAtSameMomentAs(startFilter) ||
          task.date.isAtSameMomentAs(endFilter)) {
        filtered.add(task);
      } else if (task.date.isAfter(startFilter) &&
          task.date.isBefore(endFilter)) {
        filtered.add(task);
      }
      //print(filtered);
    }
    return filtered;
  }

  @override
  Future<List<TaskModel>> readAll() async {
    final conn = await _hiveConnectionFactory.openConnection();
    final resultTasksMap = await conn.readAll('todo');
    //print('findByPeriod');
    //print(resultTasksMap);
    final resultTasksModel =
        resultTasksMap.map((e) => TaskModel.fromMap(e)).toList();
    return resultTasksModel;
  }

  @override
  Future<void> delete(String uuid) async {
    final conn = await _hiveConnectionFactory.openConnection();
    await conn.delete(boxName: 'todo', fieldId: uuid);
  }

  @override
  Future<void> update(Map<String, dynamic> data) async {
    final conn = await _hiveConnectionFactory.openConnection();
    await conn.update(boxName: 'todo', data: data);
  }
}
