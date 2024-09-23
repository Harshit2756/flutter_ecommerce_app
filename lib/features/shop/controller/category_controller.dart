import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load Categories data
<<<<<<< HEAD
    fetchCategories();
  }

  /// -- Load Categories data
  Future<void> fetchCategories() async {
=======
    loadCategories();
  }

  /// -- Load Categories data
  Future<void> loadCategories() async {
>>>>>>> 4129d0a92fdceee4d225d1f6c8b17793a30f28da
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from the datasource
      final categories = await _categoryRepository.getAllCategories();

      // Update the categroies list
      allCategories.assignAll(categories);

      // Filter the categories list
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    } finally {
      // Hide loader
      isLoading.value = false;
    }
  }

  /// -- Load Selected Category data

  ///  Get Category or Sub-Category Products
}
