import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TasksModel {
  String? title;
  bool? reminder;
  String? date;
  bool? isDone;
  String? icon;
  String? color;

  TasksModel({
    this.title,
    this.reminder,
    this.date,
    this.isDone,
    this.icon,
    this.color,
  });

  factory TasksModel.fromJson(Map<String, dynamic> json) =>
      _$TasksModelFromJson(json);
}
