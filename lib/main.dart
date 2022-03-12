import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/home/tasks/viewmodel/task_view_model.dart';

import 'core/extensions/app_extensions.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'features/auth/login/view/login_view.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TasksViewModel>(
            create: (_) => TasksViewModel(),
          ),
        ],
        child: const MyApp(),
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
      home: LoginView(),
    );
  }

  ThemeData _theme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: context.secondaryBackground,
        appBarTheme: _appBarTheme,
      );

  AppBarTheme get _appBarTheme => const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      );
}
