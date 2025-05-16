import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/dialog_button.dart';
import 'package:todo_app/widgets/task_priority_gridview.dart';

Future<int> showTaskPriorityDialog(BuildContext context) async {
  int selectedPriority = 1;

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: ColorConstants.appBarBgColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Task Priority',
                    style: TextstyleConstants.homePlaceHolderTitle,
                  ),
                  Divider(color: Colors.white, thickness: 1),
                  TaskPriorityGridview(
                    selectedPriority: selectedPriority,
                    onChanged: (value) {
                      setState(() {
                        selectedPriority = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DialogButton(
                        label: 'Cancel',
                        isTransparent: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      DialogButton(
                        label: 'Save',
                        onPressed: () {
                          Navigator.of(context).pop(selectedPriority);
                        },
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
  return selectedPriority;
}
