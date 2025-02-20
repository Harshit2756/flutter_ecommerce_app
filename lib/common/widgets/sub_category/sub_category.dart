import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../appbar/appbar.dart';
import '../images/h_rounded_images.dart';
import '../products/product_cards/product_card_horizontal.dart';
import '../texts/section_heading.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const HRoundImage(
                imageUrl: HImages.promoBanner2,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Sub Categories
              Column(
                children: [
                  const HSectionHeading(title: 'Sports Shoes'),
                  const SizedBox(height: HSizes.spaceBtwSections),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, index) =>
                          const SizedBox(width: HSizes.spaceBtwItems),
                      itemBuilder: (_, index) {
                        return const HProductCardHonrizontal();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
