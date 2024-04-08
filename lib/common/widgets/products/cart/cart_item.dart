import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/h_rounded_images.dart';
import '../../texts/h_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class HCartItem extends StatelessWidget {
  const HCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HRoundImage(
          imageUrl: HImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(HSizes.sm),
          backgroundColor: HHelperFunctions.isDarkMode(context)
              ? HColors.darkerGrey
              : HColors.light,
        ),
        const SizedBox(width: HSizes.spaceBtwItems),

        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HBrandTileWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: HProductTitleText(
                    title: 'Nike Air Max 270 React ENG', maxLines: 2),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 9 ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
