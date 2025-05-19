import 'package:flutter/material.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/utils/category_methods.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/dialog_button.dart';

final List<Color> categoryColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.brown,
  Colors.cyan,
];

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController categoryController = TextEditingController();
  final IconData categoryIcon = Icons.abc_rounded;
  int selectedColorIndex = 0;

  void onCreateCategoryPressed() {
    Navigator.pop(context);
    final newCategory = CategoryModel(
      name: categoryController.text.trim(),
      iconCodePoint: Icons.abc.codePoint,
      colorValue: categoryColors[selectedColorIndex].value,
    );

    CategoryMethods().addCategoryToLocalDB(newCategory);
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
                'Create new category',
                style: TextstyleConstants.homePlaceHolderTitle,
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: 'Enter Category name',
                labelText: 'Category name:',
                controller: categoryController,
              ),
              SizedBox(height: 20),
              Text('Category icon:', style: TextstyleConstants.buttonText),
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
                  'Choose icon from library',
                  style: TextstyleConstants.buttonText,
                ),
              ),
              SizedBox(height: 20),
              Text('Category color:', style: TextstyleConstants.buttonText),
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
                    label: 'Create Category',
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
