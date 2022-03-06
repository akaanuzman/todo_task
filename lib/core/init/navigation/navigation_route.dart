import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;

import '../../../features/auth/register/view/register_view.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegisterView.path:
        return CupertinoPageRoute(builder: (_) => const RegisterView());
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
