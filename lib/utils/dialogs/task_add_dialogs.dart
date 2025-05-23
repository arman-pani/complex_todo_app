import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/utils/dialogs/add_dialog.dart';
import 'package:todo_app/widgets/category_gridview.dart';
import 'package:todo_app/widgets/task_priority_gridview.dart';

class TaskAddDialogs {
  Future<int> showTaskPriorityDialog(
    BuildContext context,
    int selectedPriority,
  ) async {
    await showAddDialog(
      context: context,
      title: 'Task Priority',
      onSavePressed: () => context.pop(selectedPriority),
      items: [
        StatefulBuilder(
          builder: (contex, setState) {
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
    );
    return selectedPriority;
  }

  Future<int> showCategoryDialog(
    BuildContext context,
    int selectedCategoryIndex,
  ) async {
    await showAddDialog(
      context: context,
      title: 'Task Category',
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
      onSavePressed: () => context.pop(selectedCategoryIndex),
    );

    return selectedCategoryIndex;
  }
}
