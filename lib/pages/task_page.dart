import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/utils/task_edit_dialogs.dart';
import 'package:todo_app/utils/task_methods.dart';

class TaskPage extends StatefulWidget {
  final String taskId;
  const TaskPage({super.key, required this.taskId});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TaskModel task;

  @override
  void initState() {
    super.initState();
    task = TaskMethods().getTaskInfoById(widget.taskId)!;
  }

  void refreshTask() {
    setState(() {
      task = TaskMethods().getTaskInfoById(widget.taskId)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            spacing: 20,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.repeat_rounded),
                    color: Colors.white,
                  ),
                ],
              ),

              ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: Radio<bool>(
                  toggleable: true,
                  visualDensity: VisualDensity.compact,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  value: true,
                  groupValue: task.isComplete,
                  onChanged: (value) {
                    setState(() {
                      TaskMethods().toggleTaskCompletion(task.id);
                      debugPrint("Task: ${task.toString()}");
                    });
                  },
                ),
                title: Text(
                  task.title,
                  style: TextstyleConstants.homePlaceHolderTitle,
                ),
                subtitle: Text(
                  task.description,
                  style: TextstyleConstants.hintText,
                ),

                trailing: IconButton(
                  onPressed: () async {
                    await showEditTaskTitleDescriptionDialog(context, task);
                    refreshTask();
                  },
                  icon: Icon(Icons.edit_rounded, color: Colors.white),
                ),
              ),

              taskInfoRow(
                icon: Icons.timer_outlined,
                title: 'Task Time:',
                buttonText: formatTaskDateTime(task.date, task.time),
                onTap: () {},
              ),
              taskInfoRow(
                icon: Icons.tag_rounded,
                title: 'Task Category:',
                buttonText: task.category.name,
                buttonIcon: task.category.icon,
                onTap: () async {
                  await showEditTaskCategoryDialog(context, task);
                  refreshTask();
                },
              ),
              taskInfoRow(
                icon: Icons.flag_outlined,
                title: 'Task Priority:',
                buttonText: task.priority.toString(),
                onTap: () async {
                  await showEditTaskPriorityDialog(context, task);
                  refreshTask();
                },
              ),
              taskInfoRow(
                icon: Icons.roundabout_left,
                title: 'Sub - Task',
                buttonText: 'Add Sub - Task',
                onTap: () {},
              ),

              ListTile(
                onTap: () => showDeleteTaskDialog(context: context, task: task),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                leading: Icon(Icons.delete, color: Colors.red, size: 24),
                title: Text(
                  'Delete Task',
                  style: TextstyleConstants.buttonText.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget taskInfoRow({
    required IconData icon,
    required String title,
    required String buttonText,
    required VoidCallback onTap,
    IconData? buttonIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(width: 10),
          Text(title, style: TextstyleConstants.buttonText),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConstants.grey1,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                spacing: 10,
                children: [
                  if (buttonIcon != null)
                    Icon(buttonIcon, color: Colors.white, size: 24),
                  Text(buttonText, style: TextstyleConstants.underText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
