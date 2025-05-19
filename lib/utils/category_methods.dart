import 'package:hive/hive.dart';
import 'package:todo_app/models/category_model.dart';

class CategoryMethods {
  final categoriesBox = Hive.box<CategoryModel>('categories');

  void addCategoryToLocalDB(CategoryModel newCategory) {
    categoriesBox.add(newCategory);
  }

  List<CategoryModel> getAllCategories() {
    return categoriesBox.values.toList();
  }

  void initializeCategoryBox() {
    if (categoriesBox.isEmpty) {
      categoriesBox.addAll(initialCategories);
    }
  }
}
