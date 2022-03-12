import 'dart:async';

import '../model/task_model.dart';
import '../service/ITaskService.dart';
import '../service/tasks_service.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/base/viewmodel/base_view_model.dart';

class TasksViewModel extends BaseViewModel {
  late final ITasksService tasksService;
  List<TasksModel> items = [];
  bool isLoad = false;

  @override
  void init() {
    tasksService = TasksService(networkManager.dio);
  }

  Future<void> fetchAllTasks(String token) async {
    Timer(context.durationSlow, loadPage);
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
    await tasksService.addTasks(token, title, reminder, icon, color);
    setState();
  }

  Future<void> deleteTask(String token, String id) async {
    await tasksService.deleteTask(token, id);
    setState();
  }

  void loadPage() {
    isLoad = !isLoad;
    setState();
  }
}
