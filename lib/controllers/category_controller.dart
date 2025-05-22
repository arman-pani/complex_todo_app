import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/category_model.dart';

class CategoryController extends GetxController {
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  final Box<CategoryModel> _categoryBox;

  CategoryController(this._categoryBox);

  @override
  void onInit() {
    super.onInit();
    _loadCategoriesFromHive();
  }

  _loadCategoriesFromHive() {
    if (_categoryBox.isEmpty) {
      _categoryBox.addAll(initialCategories);
    }
    categories.assignAll(_categoryBox.values);
  }

  void addCategory(CategoryModel newCategory) {
    categories.add(newCategory);
    _categoryBox.add(newCategory);
  }

  void removeCategory(int index) {
    categories.removeAt(index);
    _categoryBox.deleteAt(index);
  }
}
