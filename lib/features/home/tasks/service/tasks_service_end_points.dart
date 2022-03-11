// ignore_for_file: constant_identifier_names

enum TasksServiceEndPoints { TASKS,DELETE }

extension TasksServiceExtension on TasksServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case TasksServiceEndPoints.TASKS:
        return '/todo';
      case TasksServiceEndPoints.DELETE:
      return '/todo/$token';
    }
  }
}