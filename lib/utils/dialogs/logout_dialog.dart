import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/dialog_button.dart';

Future<void> showLogoutDialog({
  required BuildContext context,
  required VoidCallback onPressed,
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
                  Text(
                    'Logout',
                    style: TextstyleConstants.homePlaceHolderTitle,
                  ),
                  Divider(color: Colors.white, thickness: 1),
                  Text(
                    'Do you want to logout?',
                    style: TextstyleConstants.addTaskHintText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DialogButton(
                        label: 'Cancel',
                        isTransparent: true,
                        onPressed: () => context.pop(),
                      ),
                      DialogButton(label: 'Logout', onPressed: onPressed),
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
