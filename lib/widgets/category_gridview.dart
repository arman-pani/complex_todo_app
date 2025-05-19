import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/category_model.dart';

class CategoryGridView extends StatefulWidget {
  final int selectedCategoryIndex;
  final ValueChanged<int> onChanged;
  const CategoryGridView({
    super.key,
    required this.selectedCategoryIndex,
    required this.onChanged,
  });

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<CategoryModel>('categories').listenable(),
      builder: (context, categories, child) {
        final categoryList = categories.values.toList();
        return GridView.builder(
          itemCount: categoryList.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final category = categoryList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.onChanged(index);
                });
              },
              child: CategoryGridItem(
                category: category,
                isSelected: widget.selectedCategoryIndex == index,
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
