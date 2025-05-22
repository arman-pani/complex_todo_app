import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/dialog_button.dart';

Future<void> showAddDialog({
  required BuildContext context,
  required String title,
  required List<Widget> items,
  required VoidCallback onSavePressed,
}) async {
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
                  Text(title, style: TextstyleConstants.homePlaceHolderTitle),
                  Divider(color: Colors.white, thickness: 1),
                  ...items,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DialogButton(
                        label: 'Cancel',
                        isTransparent: true,
                        onPressed: () => context.pop(),
                      ),
                      DialogButton(label: 'Save', onPressed: onSavePressed),
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
