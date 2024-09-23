import 'package:get/get.dart';

import '../../../data/repositories/banner/banner_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class BannerController extends GetxController {
  static BannerController get to => Get.find();

  final RxInt currentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  void updatePageIndecator(index) {
    currentIndex.value = index;
  }

  /// F
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from the datasource
      final categories = await _bannerRepository.getAllCategories();

      // Update the categroies list
      allCategories.assignAll(categories);

      
    } catch (e) {
      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    } finally {
      // Hide loader
      isLoading.value = false;
    }
  }
}
