// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../model/task_model.dart';

abstract class ITasksService {
  final Dio dio;

  ITasksService(this.dio);

  Future<List<TasksModel>> fetchAllTasks(String token);

  Future<TasksModel> addTasks(
      String token, String title, bool reminder, String icon, String color);

  Future<void> deleteTask(String token,String id);

}
