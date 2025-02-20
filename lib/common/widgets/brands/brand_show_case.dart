import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'h_brand_card.dart';

class HBrandShowcase extends StatelessWidget {
  const HBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return HRoundedContainer(
      showBorder: true,
      borderColor: HColors.darkGrey,
      backgroundColor: HColors.transparent,
      margin: const EdgeInsets.only(bottom: HSizes.defaultSpace),
      padding: const EdgeInsets.all(HSizes.md),
      child: Column(
        children: [
          /// Brands with Products Count
          const HBrandCard(showBorder: false),

          const SizedBox(height: HSizes.spaceBtwItems),

          /// Brand Top 3 Products Image
          Row(
            children: images
                .map((image) => brandTOpProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTOpProductImageWidget(String image, context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return Expanded(
      child: HRoundedContainer(
        height: 100,
        backgroundColor: isDark ? HColors.darkerGrey : HColors.light,
        margin: const EdgeInsets.only(right: HSizes.sm),
        padding: const EdgeInsets.all(HSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
