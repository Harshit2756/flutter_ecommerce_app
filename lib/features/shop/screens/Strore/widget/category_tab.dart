import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class HCategoryTab extends StatelessWidget {
  const HCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const HBrandShowcase(
                images: [
                  HImages.productImage1,
                  HImages.productImage2,
                  HImages.productImage3,
                ],
              ),
              const HBrandShowcase(
                images: [
                  HImages.productImage1,
                  HImages.productImage2,
                  HImages.productImage3,
                ],
              ),

              /// -- Products
              HSectionHeading(
                title: 'You might like',
                onButtonTap: () {},
              ),

              const SizedBox(height: HSizes.spaceBtwItems),

              /// -- Products Grid
              HGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const HProductCardVertical()),

              const SizedBox(height: HSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
