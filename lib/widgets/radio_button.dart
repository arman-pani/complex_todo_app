import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';

class TaskRadioButton extends StatelessWidget {
  final String taskId;
  TaskRadioButton({super.key, required this.taskId});

  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isComplete = taskController.tasks[taskId]!.isComplete;
      return Radio<bool>(
        toggleable: true,
        visualDensity: VisualDensity.compact,
        fillColor: WidgetStatePropertyAll(Colors.white),
        value: true,
        groupValue: isComplete,
        onChanged: (value) {
          taskController.toggleTaskCompletion(taskId);
        },
      );
    });
  }
}
