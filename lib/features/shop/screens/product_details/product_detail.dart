import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../product_reviews/product_reviews.dart';
import 'widget/bottom_add_to_cart_widget.dart';
import 'widget/product_attributes.dart';
import 'widget/product_detail_image_slider.dart';
import 'widget/product_meta_data.dart';
import 'widget/rating_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 -- Product Image Slider
            const HProductImageSlider(),

            /// 2 -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                left: HSizes.defaultSpace,
                right: HSizes.defaultSpace,
                bottom: HSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// - Rating & Share
                  const HRatingAndShare(),

                  /// - Price,Title,Stock & Brand
                  const HProductMetaData(),

                  /// -- Attributes
                  const HProductAttributes(),

                  const SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add to Cart'),
                    ),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),

                  /// - Description
                  const HSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  const ReadMoreText(
'ReadMoreTextReadMoreTextReadMoreTextReadMoreTextReadMoreTextReadMoreTextReadMoreText adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: HSizes.spaceBtwSections),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HSectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
