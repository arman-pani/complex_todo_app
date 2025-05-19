import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/utils/task_methods.dart';

class TaskListTile extends StatefulWidget {
  final TaskModel task;
  const TaskListTile({super.key, required this.task});

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    debugPrint(
      "after build ${widget.task.title}Task: ${widget.task.toString()}",
    );

    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRouterConstants.task,
        pathParameters: {'taskId': widget.task.id},
      ),
      child: ListTile(
        tileColor: ColorConstants.hintTextColor,
        minLeadingWidth: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        leading: Radio<bool>(
          toggleable: true,
          visualDensity: VisualDensity.compact,
          fillColor: WidgetStatePropertyAll(Colors.white),
          value: true,
          groupValue: widget.task.isComplete,
          onChanged: (value) {
            setState(() {
              TaskMethods().toggleTaskCompletion(widget.task.id);
              debugPrint("Task: ${widget.task.toString()}");
            });
          },
        ),
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          widget.task.title,
          style: TextstyleConstants.onboardingSubTitle,
        ),

        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                formatTaskDateTime(widget.task.date, widget.task.time),
                style: TextstyleConstants.mediumText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ColorConstants.purple,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.cast_for_education, size: 14, color: Colors.white),
                  Text(
                    widget.task.category,
                    style: TextstyleConstants.underText,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.purple),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.flag_outlined, size: 14, color: Colors.white),
                  Text(
                    widget.task.priority.toString(),
                    style: TextstyleConstants.underText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
