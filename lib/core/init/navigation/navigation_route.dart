import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;

import '../../../features/auth/register/view/register_view.dart';
import '../../../features/home/tasks/view/tasks_view.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegisterView.path:
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      case TasksView.path:
        return CupertinoPageRoute(builder: (_) => const TasksView());
      default:
        return CupertinoPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }
}
