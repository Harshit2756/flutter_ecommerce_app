import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_hub/features/shop/screens/all_products/all_products.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/home_appbar.dart';
import 'widget/home_categories.dart';
import 'widget/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Primary Header Container
            const HPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar
                  HHomeAppBar(),
                  SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Search Bar
                  HSearchContainer(text: 'Search in store'),
                  SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: HSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Section Heading
                        HSectionHeading(
                          title: 'Popular Categories s',
                          textColor: HColors.white,
                          showActionButton: false,
                        ),

                        SizedBox(height: HSizes.spaceBtwItems),

                        /// -- Categories List
                        HHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const HPromoSlider(
                    banners: [
                      HImages.promoBanner1,
                      HImages.promoBanner2,
                      HImages.promoBanner3,
                    ],
                  ),

                  /// -- Section Heading
                  HSectionHeading(
                    title: 'Popular Categories',
                    onButtonTap: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  HGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return const HProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
