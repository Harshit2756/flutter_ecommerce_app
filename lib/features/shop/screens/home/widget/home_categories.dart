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
<<<<<<< HEAD
        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              'No Data Found!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }
        return SizedBox(
          height: 100,
=======
        return SizedBox(
          height: 80,
>>>>>>> 4129d0a92fdceee4d225d1f6c8b17793a30f28da
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.featuredCategories.length,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return HVerticalImageText(
<<<<<<< HEAD
                image: category.image,
=======
                image:category.image,
>>>>>>> 4129d0a92fdceee4d225d1f6c8b17793a30f28da
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
