import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/shimmer/category_shimmers.dart';
import '../../../../../common/widgets/sub_category/sub_category.dart';
import '../../../controller/category_controller.dart';

class HHomeCategories extends StatelessWidget {
  const HHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) {
          return const HCategoryShimmer();
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.featuredCategories.length,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return HVerticalImageText(
                image:category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        );
      },
    );
  }
}
