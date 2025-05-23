import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/category_controller.dart';
import 'package:todo_app/models/category_model.dart';

class CategoryGridView extends StatelessWidget {
  final int selectedCategoryIndex;
  final ValueChanged<int> onChanged;
  const CategoryGridView({
    super.key,
    required this.selectedCategoryIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return GridView.builder(
          itemCount: controller.categories.length + 1,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return (index != controller.categories.length)
                ? GestureDetector(
                    onTap: () => onChanged(index),
                    child: CategoryGridItem(
                      category: controller.categories[index],
                      isSelected: selectedCategoryIndex == index,
                    ),
                  )
                : GestureDetector(
                    onTap: () =>
                        context.pushNamed(AppRouterConstants.addCategory),
                    child: CategoryGridItem(
                      category: CategoryModel(
                        name: 'Add new',
                        iconCodePoint: Icons.add_rounded.codePoint,
                        colorValue: ColorConstants.purple.value,
                      ),
                      isSelected: true,
                    ),
                  );
          },
        );
      },
    );
  }
}

class CategoryGridItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            category.icon,
            color: isSelected ? Colors.white : Colors.black,
            size: 32,
          ),
        ),
        Text(
          category.name,
          style: TextstyleConstants.mediumText.copyWith(
            color: isSelected ? Colors.white : ColorConstants.hintTextColor2,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
