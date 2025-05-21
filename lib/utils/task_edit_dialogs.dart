import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/category_methods.dart';
import 'package:todo_app/widgets/category_gridview.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/dialog_button.dart';
import 'package:todo_app/widgets/edit_dialog.dart';
import 'package:todo_app/widgets/task_priority_gridview.dart';

class TaskEditDialogs {
  TaskController taskController;
  TaskEditDialogs(this.taskController);

  Future<void> showEditTaskTitleDescriptionDialog(
    BuildContext context,
    TaskModel oldTask,
  ) async {
    final titleController = TextEditingController(text: oldTask.title);
    final descriptionController = TextEditingController(
      text: oldTask.description,
    );

    await showEditDialog(
      context: context,
      items: [
        CustomTextField(
          labelText: 'New Title',
          hintText: 'Enter new title',
          controller: titleController,
        ),
        CustomTextField(
          labelText: 'New Description',
          hintText: 'Enter new description',
          controller: descriptionController,
        ),
      ],
      title: StringConstants.editTaskDialogTitle1,
      onEditPressed: () => taskController.updateTask(
        oldTask.copyWith(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
        ),
      ),
    );
  }

  Future<void> showEditTaskCategoryDialog(
    BuildContext context,

    TaskModel oldTask,
  ) async {
    int selectedCategoryIndex = 0;
    await showEditDialog(
      context: context,
      items: [
        StatefulBuilder(
          builder: (context, setState) {
            return CategoryGridView(
              selectedCategoryIndex: selectedCategoryIndex,
              onChanged: (value) {
                setState(() {
                  selectedCategoryIndex = value;
                });
              },
            );
          },
        ),
      ],
      title: StringConstants.editTaskDialogTitle2,
      onEditPressed: () => taskController.updateTask(
        oldTask.copyWith(
          category: CategoryMethods().getAllCategories()[selectedCategoryIndex],
        ),
      ),
    );
  }

  Future<void> showEditTaskPriorityDialog(
    BuildContext context,
    TaskModel oldTask,
  ) async {
    int selectedPriority = 1;
    await showEditDialog(
      context: context,
      items: [
        StatefulBuilder(
          builder: (context, setState) {
            return TaskPriorityGridview(
              selectedPriority: selectedPriority,
              onChanged: (value) {
                setState(() {
                  selectedPriority = value;
                });
              },
            );
          },
        ),
      ],
      title: StringConstants.editTaskDialogTitle3,
      onEditPressed: () => taskController.updateTask(
        oldTask.copyWith(priority: selectedPriority),
      ),
    );
  }

  Future<void> showDeleteTaskDialog({
    required BuildContext context,
    required TaskModel task,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorConstants.appBarBgColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Text(
                  StringConstants.deleteTaskDialogTitle,
                  style: TextstyleConstants.homePlaceHolderTitle,
                ),
                Divider(color: Colors.white, thickness: 1),
                Text(
                  StringConstants.deleteTaskDialogSubTitle(task.title),
                  style: TextstyleConstants.addTaskHintText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DialogButton(
                        label: 'Cancel',
                        isTransparent: true,
                        onPressed: () => context.pop(),
                      ),
                    ),
                    Expanded(
                      child: DialogButton(
                        label: 'Delete',
                        onPressed: () {
                          taskController.deleteTask(task.id);
                          context.goNamed(AppRouterConstants.home);
                        },
                      ),
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
}
