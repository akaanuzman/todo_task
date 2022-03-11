// ignore_for_file: constant_identifier_names

enum TasksServiceEndPoints { TASKS }

extension TasksServiceExtension on TasksServiceEndPoints {
  String get rawValue {
    switch (this) {
      case TasksServiceEndPoints.TASKS:
        return '/todo';
    }
  }
}