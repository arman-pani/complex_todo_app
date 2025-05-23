import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/controllers/auth_controller.dart';
import 'package:todo_app/controllers/category_controller.dart';
import 'package:todo_app/controllers/task_add_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/timeofday_adapter.dart';
import 'package:todo_app/utils/app_router.dart';
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
  final categoryBox = await Hive.openBox<CategoryModel>('categories');

  runApp(
    MyApp(
      isLogin: isLogin ?? false,
      taskBox: taskBox,
      categoryBox: categoryBox,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  final Box<TaskModel> taskBox;
  final Box<CategoryModel> categoryBox;
  const MyApp({
    super.key,
    required this.isLogin,
    required this.taskBox,
    required this.categoryBox,
  });

  GoRouter getAppRouter() =>
      appRouter(initialLocation: isLogin ? '/home' : '/onboard');

  @override
  Widget build(BuildContext context) {
    final router = getAppRouter();
    return GetMaterialApp.router(
      title: 'ToDo App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
        ),
      ),

      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      initialBinding: BindingsBuilder(() {
        Get.put(TaskController(taskBox));
        Get.put(CategoryController(categoryBox));
        Get.put(TaskAddController());
        Get.put(AuthController());
      }),
    );
  }
}
