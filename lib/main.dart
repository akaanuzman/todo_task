import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/extensions/app_extensions.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'features/auth/login/view/login_view.dart';

void main() => runApp(
      DevicePreview(
        builder: (_) => const MyApp(),
        enabled: true,
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: NavigationRoute.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Todo Task',
      theme: _theme(context),
      home: const LoginView(),
    );
  }

  ThemeData _theme(BuildContext context) => ThemeData(
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: context.textColor),
      );
}