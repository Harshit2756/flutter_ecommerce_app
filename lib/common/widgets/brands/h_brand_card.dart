import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/h_circular_image.dart';
import '../texts/h_brand_title_text_with_verified_icon.dart';

class HBrandCard extends StatelessWidget {
  const HBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: HRoundedContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(HSizes.sm),
        backgroundColor: HColors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: HCircularImage(
                image: HImages.nikeLogo,
                backgroundColor: HColors.transparent,
                overlayColor: isDark ? HColors.white : HColors.black,
              ),
            ),
            const SizedBox(width: HSizes.spaceBtwItems / 2),

            /// -- Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HBrandTileWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 Products are there in the store",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
