import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/screens/home/home.dart';
import 'package:task_manager/screens/home/section.dart';
import 'package:task_manager/utils/material_color_palette.dart';

/// Holds all the requirements by the application.
///
/// This is based on [Task manager by Luky Erdiand](https://dribbble.com/shots/16744591-Task-Manager).
class TaskManagerApplication extends StatelessWidget {
  const TaskManagerApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Section(),
        ),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: MaterialColorPalette.dark,
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          HomeScreen.routePath: (context) => const HomeScreen(),
        },
        initialRoute: HomeScreen.routePath,
      ),
    );
  }
}
