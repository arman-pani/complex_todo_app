import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/pages/add_category_page.dart';
import 'package:todo_app/widgets/category_gridview.dart';
import 'package:todo_app/widgets/custom_text_button2.dart';

Future<int> showCategoryDialog(BuildContext context) async {
  int selectedCategoryIndex = 0;

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
                spacing: 10,
                children: [
                  Text(
                    'Choose Category',
                    style: TextstyleConstants.homePlaceHolderTitle,
                  ),
                  Divider(color: Colors.white, thickness: 1),
                  CategoryGridView(
                    selectedCategoryIndex: selectedCategoryIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedCategoryIndex = value;
                      });
                    },
                  ),
                  CustomTextButton2(
                    label: 'Add Category',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCategoryPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );

  return selectedCategoryIndex;
}
