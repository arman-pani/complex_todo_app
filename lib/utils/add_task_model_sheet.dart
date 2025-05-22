import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/category_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/dialogs/task_add_dialogs.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/utils/show_snackbar.dart';
import 'package:todo_app/widgets/custom_text_field2.dart';

Future<void> showAddTaskModalSheet(BuildContext context) async {
  final TaskController taskController = Get.find<TaskController>();
  final CategoryController categoryController = Get.find<CategoryController>();

  final taskTextController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int selectedPriority = 1;
  int selectedCategory = 0;

  TaskAddDialogs taskAddDialogs = TaskAddDialogs(taskController);

  void saveTaskButton() {
    final title = taskTextController.text.trim();
    if (title != "") {
      final newTask = TaskModel(
        title: title,
        description: descriptionController.text.trim(),
        date: selectedDate,
        time: selectedTime,
        priority: selectedPriority,
        category: categoryController.categories[selectedCategory],
      );
      taskController.addTask(newTask);
      Navigator.pop(context);
      showSnackBar(context, 'New Task Added');
    } else {
      showSnackBar(context, 'Task field is empty!');
    }
  }

  await showModalBottomSheet(
    context: context,
    backgroundColor: ColorConstants.appBarBgColor,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void onPriorityPressed() async {
            final result = await taskAddDialogs.showTaskPriorityDialog(
              context,
              selectedPriority,
            );
            setState(() {
              selectedPriority = result;
            });
          }

          void onCategoryPressed() async {
            final result = await taskAddDialogs.showCategoryDialog(
              context,
              selectedCategory,
            );
            setState(() {
              selectedCategory = result;
            });
          }

          void selectDate(
            BuildContext context,
            void Function(void Function()) setState,
          ) async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
            );
            if (pickedDate != null && pickedDate != selectedDate) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null && pickedTime != selectedTime) {
              setState(() {
                selectedTime = pickedTime;
              });
            }
          }

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Task',
                        style: TextstyleConstants.homePlaceHolderTitle,
                      ),
                      Text(
                        '${formatDateTimetoString(selectedDate)}, ${formatTimeOfDayToString(selectedTime)}',
                        style: TextstyleConstants.onboardingSubTitle,
                      ),
                    ],
                  ),
                  CustomTextField2(
                    hintText: 'Task',
                    controller: taskTextController,
                  ),
                  CustomTextField2(
                    hintText: 'Description',
                    controller: descriptionController,
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () => selectDate(context, setState),
                        icon: Icon(Icons.timer_outlined),
                      ),
                      IconButton(
                        onPressed: onCategoryPressed,
                        icon: Row(
                          spacing: 3,
                          children: [
                            Icon(
                              categoryController
                                  .categories[selectedCategory]
                                  .icon,
                            ),
                            Text(
                              style: TextstyleConstants.underText,
                              categoryController
                                  .categories[selectedCategory]
                                  .name,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: onPriorityPressed,
                        icon: Row(
                          spacing: 3,
                          children: [
                            Icon(Icons.flag_outlined),
                            Text(
                              style: TextstyleConstants.underText,
                              selectedPriority.toString(),
                            ),
                          ],
                        ),
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
    },
  );
}
