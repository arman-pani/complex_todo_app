import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/widgets/radio_button.dart';

class TaskListTile extends StatefulWidget {
  final String taskId;
  const TaskListTile({super.key, required this.taskId});

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    final TaskModel task = taskController.tasks[widget.taskId]!;
    debugPrint("after build ${task.title}Task: ${task.toString()}");

    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRouterConstants.task,
        pathParameters: {'taskId': task.id},
      ),
      child: ListTile(
        tileColor: ColorConstants.hintTextColor,
        minLeadingWidth: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        titleAlignment: ListTileTitleAlignment.center,

        leading: TaskRadioButton(taskId: task.id, groupValue: task.isComplete),

        title: Text(task.title, style: TextstyleConstants.onboardingSubTitle),

        subtitle: Row(
          spacing: 5,
          children: [
            Expanded(
              child: Text(
                formatTaskDateTime(task.date, task.time),
                style: TextstyleConstants.mediumText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            categoryContainer(task.category),
            priorityContainer(task.priority),
          ],
        ),
      ),
    );
  }

  Container categoryContainer(CategoryModel category) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        spacing: 5,
        children: [
          Icon(category.icon, size: 14, color: Colors.white),
          Text(category.name, style: TextstyleConstants.underText),
        ],
      ),
    );
  }

  Container priorityContainer(int priority) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.purple),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        spacing: 5,
        children: [
          Icon(Icons.flag_outlined, size: 14, color: Colors.white),
          Text(priority.toString(), style: TextstyleConstants.underText),
        ],
      ),
    );
  }
}
