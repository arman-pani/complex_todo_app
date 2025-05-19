import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/timeofday_adapter.dart';
import 'package:todo_app/utils/app_router.dart';
import 'package:todo_app/utils/category_methods.dart';
import 'package:todo_app/utils/prefs_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLogin = await SharedPrefsMethods.getIsLogin();

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.toString());

  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());

  await Hive.openBox<TaskModel>('tasks');
  await Hive.openBox<CategoryModel>('categories');
  CategoryMethods().initializeCategoryBox();

  runApp(MyApp(isLogin: isLogin ?? false));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ToDo App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),

      routerConfig: appRouter(initialLocation: isLogin ? '/home' : '/onboard'),
    );
  }
}
