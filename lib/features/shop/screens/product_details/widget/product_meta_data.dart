import 'package:ecommerce_app/common/widgets/images/h_circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_title.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class HProductMetaData extends StatelessWidget {
  const HProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// Sale Tag
            HRoundedContainer(
              radius: HSizes.sm,
              backgroundColor: HColors.secondary.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: HSizes.sm,
                vertical: HSizes.xs,
              ),
              child: Text(
                '20%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: HColors.black),
              ),
            ),

            const SizedBox(width: HSizes.spaceBtwItems),

            /// Price
            const HProductPriceText(
              price: '200',
              lineThrough: true,
            ),
            const SizedBox(width: HSizes.spaceBtwItems),
            const HProductPriceText(
              price: '200',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        /// Title
        const HProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const HProductTitleText(title: 'Status'),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          ],
        ),

        const SizedBox(height: HSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            HCircularImage(
              image: HImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: HHelperFunctions.isDarkMode(context)
                  ? HColors.white
                  : HColors.black,
            ),
            const HBrandTileWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
