import 'dart:async';

import 'package:todo_task/features/home/tasks/model/task_model.dart';
import 'package:todo_task/features/home/tasks/service/ITaskService.dart';
import 'package:todo_task/features/home/tasks/service/tasks_service.dart';
import '../../../../core/base/viewmodel/base_view_model.dart';

class TasksViewModel extends BaseViewModel {
  late final ITasksService tasksService;
  List<TasksModel> items = [];
  bool isDone = false;
  bool isReminder = false;

  @override
  void init() {
    tasksService = TasksService(networkManager.dio);
  }

  Future<void> fetchAllTasks(String token) async {
    items = await tasksService.fetchAllTasks(token);
    for (var item in items) {
      if (item.date != null) {
        item.date = item.date!.substring(0, 10);
      }
    }
    setState();
  }

  Future<void> addTask(String token, String title, bool reminder, String icon,
      String color) async {
    items.add(await tasksService.addTasks(token, title, reminder, icon, color));

    setState();
  }

  Future<void> deleteTask(String token, String id) async {
    await tasksService.deleteTask(token, id);
    setState();
  }

  void doneTask() {
    isDone = !isDone;
    setState();
  }
}
