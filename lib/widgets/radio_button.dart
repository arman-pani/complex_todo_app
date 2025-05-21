import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';

class TaskRadioButton extends StatelessWidget {
  final bool groupValue;
  final String taskId;
  TaskRadioButton({super.key, required this.groupValue, required this.taskId});

  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Radio<bool>(
      toggleable: true,
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStatePropertyAll(Colors.white),
      value: true,
      groupValue: groupValue,
      onChanged: (value) => taskController.toggleTaskCompletion(taskId),
    );
  }
}
