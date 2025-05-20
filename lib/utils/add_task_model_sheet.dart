import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/category_dialog.dart';
import 'package:todo_app/utils/category_methods.dart';
import 'package:todo_app/utils/task_methods.dart';
import 'package:todo_app/utils/task_priority_dialog.dart';
import 'package:todo_app/widgets/custom_text_field2.dart';

Future<void> showAddTaskModalSheet(BuildContext context) async {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int selectedPriority = 1;
  int selectedCategory = 0;

  selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null && pickedTime != selectedTime) {
        selectedTime = pickedTime;
      }
    }
  }

  void saveTaskButton() {
    final newTask = TaskModel(
      title: taskController.text.trim(),
      description: descriptionController.text.trim(),
      date: selectedDate,
      time: selectedTime,
      priority: selectedPriority,
      category: CategoryMethods().getAllCategories()[selectedCategory],
    );
    TaskMethods().addTaskToLocalDB(newTask);
    Navigator.pop(context);
  }

  await showModalBottomSheet(
    context: context,
    backgroundColor: ColorConstants.appBarBgColor,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Task',
                    style: TextstyleConstants.homePlaceHolderTitle,
                  ),
                  // Spacer(),
                  // Text(
                  //   '${formatDateTimetoString(selectedDate)}, ${formatTimeOfDayToString(selectedTime)}',
                  //   style: TextstyleConstants.homePlaceHolderTitle,
                  // ),
                ],
              ),
              CustomTextField2(hintText: 'Task', controller: taskController),
              CustomTextField2(
                hintText: 'Description',
                controller: descriptionController,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    icon: Icon(Icons.timer_outlined),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () async {
                      selectedCategory = await showCategoryDialog(context);
                    },
                    icon: Icon(Icons.category_rounded),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () async {
                      selectedPriority = await showTaskPriorityDialog(context);
                    },
                    icon: Icon(Icons.flag_outlined),
                    color: Colors.white,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: saveTaskButton,
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: ColorConstants.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
