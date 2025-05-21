import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/controllers/task_controller.dart';
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

  final taskBox = await Hive.openBox<TaskModel>('tasks');
  await Hive.openBox<CategoryModel>('categories');
  CategoryMethods().initializeCategoryBox();

  runApp(MyApp(isLogin: isLogin ?? false, taskBox: taskBox));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  final Box<TaskModel> taskBox;
  const MyApp({super.key, required this.isLogin, required this.taskBox});

  GoRouter getAppRouter() =>
      appRouter(initialLocation: isLogin ? '/home' : '/onboard');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'ToDo App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),

      routerDelegate: getAppRouter().routerDelegate,
      routeInformationParser: getAppRouter().routeInformationParser,
      routeInformationProvider: getAppRouter().routeInformationProvider,
      initialBinding: BindingsBuilder(() {
        Get.put(TaskController(taskBox));
      }),
    );
  }
}
