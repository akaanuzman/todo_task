import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;

import '../../../features/auth/login/view/login_view.dart';
import '../../../features/auth/register/view/register_view.dart';
import '../../../features/auth/success/view/success_view.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginView.path:
        return CupertinoPageRoute(builder: (_) => LoginView());
      case RegisterView.path:
        return CupertinoPageRoute(builder: (_) => RegisterView());
      case SuccessView.path:
        return CupertinoPageRoute(builder: (_) => const SuccessView());
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
