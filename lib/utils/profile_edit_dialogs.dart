import 'package:flutter/material.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/utils/image_methods.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/edit_dialog.dart';

Future<void> showEditNameDialog(BuildContext context) async {
  final nameController = TextEditingController();
  await showEditDialog(
    context: context,
    items: [
      CustomTextField(
        labelText: 'New Name',
        hintText: 'Enter new name',
        controller: nameController,
      ),
    ],
    title: StringConstants.profileLabel2,
    onEditPressed: () {},
  );
}

Future<void> showEditPasswordDialog(BuildContext context) async {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  await showEditDialog(
    context: context,
    items: [
      CustomTextField(
        labelText: 'Enter old password',
        hintText: 'Old Password',
        controller: oldPasswordController,
      ),
      CustomTextField(
        labelText: 'Enter new password',
        hintText: 'New Password',
        controller: newPasswordController,
      ),
    ],
    title: StringConstants.profileLabel2,
    onEditPressed: () {},
  );
}

Future<void> showEditImageModalSheet(BuildContext context) async {
  await showModalBottomSheet(
    backgroundColor: ColorConstants.appBarBgColor,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.profileLabel4,
              style: TextstyleConstants.homePlaceHolderTitle,
            ),
            Divider(color: Colors.white, thickness: 1),
            TextButton(
              onPressed: () async {
                final image = await ImageMethods.pickImageFromCamera();
              },
              child: Text(
                StringConstants.accountImageButtonLabel1,
                style: TextstyleConstants.buttonText,
              ),
            ),
            TextButton(
              onPressed: () async {
                final image = await ImageMethods.pickImageFromGallery();
              },
              child: Text(
                StringConstants.accountImageButtonLabel2,
                style: TextstyleConstants.buttonText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                StringConstants.accountImageButtonLabel3,
                style: TextstyleConstants.buttonText,
              ),
            ),
          ],
        ),
      );
    },
  );
}
