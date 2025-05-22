import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/category_controller.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/utils/show_snackbar.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/dialog_button.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController categoryInputController = TextEditingController();
  final IconData categoryIcon = Icons.abc_rounded;
  int selectedColorIndex = 0;

  final CategoryController categoryController = Get.find<CategoryController>();

  void onCreateCategoryPressed() {
    if (categoryInputController.text.trim() != '') {
      final newCategory = CategoryModel(
        name: categoryInputController.text.trim(),
        iconCodePoint: Icons.abc.codePoint,
        colorValue: categoryColors[selectedColorIndex].value,
      );
      categoryController.addCategory(newCategory);
      context.pop();
    } else {
      showSnackBar(context, 'Category Name field is empty!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.addCategoryPageTitle,
                style: TextstyleConstants.homePlaceHolderTitle,
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: StringConstants.addCategoryPageHintText1,
                labelText: StringConstants.addCategoryPageSubTitle1,
                controller: categoryInputController,
              ),
              SizedBox(height: 20),
              Text(
                StringConstants.addCategoryPageSubTitle2,
                style: TextstyleConstants.buttonText,
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: ColorConstants.grey1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  StringConstants.addCategoryLabel1,
                  style: TextstyleConstants.buttonText,
                ),
              ),
              SizedBox(height: 20),
              Text(
                StringConstants.addCategoryPageSubTitle3,
                style: TextstyleConstants.buttonText,
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 35,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryColors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColorIndex = index;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: categoryColors[index],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: selectedColorIndex == index
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DialogButton(
                    label: 'Cancel',
                    isTransparent: true,
                    onPressed: () => Navigator.pop(context),
                  ),
                  DialogButton(
                    label: StringConstants.addCategoryLabel2,
                    onPressed: onCreateCategoryPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
