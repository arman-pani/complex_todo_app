import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/dialog_button.dart';

Future<void> showEditDialog({
  required BuildContext context,
  required List<Widget> items,
  required String title,
  required VoidCallback onEditPressed,
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
              Text(title, style: TextstyleConstants.homePlaceHolderTitle),
              Divider(color: Colors.white, thickness: 1),

              ...items,

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
                      label: 'Edit',
                      onPressed: () {
                        onEditPressed();
                        context.pop();
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
