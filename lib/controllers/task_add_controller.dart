import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/category_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/dialogs/task_add_dialogs.dart';
import 'package:todo_app/utils/show_snackbar.dart';

class TaskAddController extends GetxController {
  late int selectedPriority;
  late int selectedCategoryIndex;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  TextEditingController titleInputController = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();

  final CategoryController categoryController = Get.find<CategoryController>();

  CategoryModel get getSelectedCategory =>
      categoryController.categories[selectedCategoryIndex];

  final TaskController taskController = Get.find<TaskController>();
  TaskAddDialogs taskAddDialogs = TaskAddDialogs();

  @override
  void onInit() {
    super.onInit();
    selectedCategoryIndex = 0;
    selectedPriority = 1;
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    update();
  }

  @override
  void onClose() {
    titleInputController.clear();
    descriptionInputController.clear();
    super.onClose();
  }

  void changePriority(BuildContext context) async {
    final pickedPriority = await taskAddDialogs.showTaskPriorityDialog(
      context,
      selectedPriority,
    );
    selectedPriority = pickedPriority;
    update();
  }

  void changeCategory(BuildContext context) async {
    final pickedCategoryIndex = await taskAddDialogs.showCategoryDialog(
      context,
      selectedCategoryIndex,
    );
    selectedCategoryIndex = pickedCategoryIndex;
    update();
  }

  void changeDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime = pickedTime;
    }
    update();
  }

  void saveTask(BuildContext context) {
    final title = titleInputController.text.trim();
    if (title != "") {
      final newTask = TaskModel(
        title: title,
        description: descriptionInputController.text.trim(),
        date: selectedDate,
        time: selectedTime,
        priority: selectedPriority,
        category: categoryController.categories[selectedCategoryIndex],
      );
      taskController.addTask(newTask);
      Get.back();
      onClose();
      showSnackBar(context, 'New Task Added');
    } else {
      showSnackBar(context, 'Task field is empty!');
    }
  }
}
