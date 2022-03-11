import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/features/home/tasks/model/task_model.dart';

import 'ITaskService.dart';
import 'tasks_service_end_points.dart';

class TasksService extends ITasksService {
  TasksService(Dio dio) : super(dio);

  @override
  Future<List<TasksModel>> fetchAllTasks(String token) async {
    try {
      final response = await dio.get(
        TasksServiceEndPoints.TASKS.rawValue(token),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;

        if (data is List) {
          return data.map((e) => TasksModel.fromJson(e)).toList();
        }
      }
      return [];
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return [];
    }
  }

  @override
  Future<TasksModel> addTasks(String token, String title, bool reminder,
      String icon, String color) async {
    try {
      final response = await dio.post(
        TasksServiceEndPoints.TASKS.rawValue(token),
        data: {
          "title": title,
          "reminder": reminder,
          "icon": icon,
          "color": color
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        debugPrint("Add success : $data");
        return TasksModel(
          title: data['title'],
          reminder: data['reminder'],
          icon: data['icon'],
          color: data['color'],
        );
      }

      return TasksModel();
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return TasksModel();
    }
  }

  @override
  Future<void> deleteTask(String token, String id) async {
    try {
      await dio.delete(
        TasksServiceEndPoints.DELETE.rawValue(id),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
    } on DioError catch (e) {
      debugPrint(e.response.toString());
    }
  }
}
