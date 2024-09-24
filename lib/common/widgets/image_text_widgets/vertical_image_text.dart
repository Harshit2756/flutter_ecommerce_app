import 'package:ecommerce_app/common/widgets/images/h_circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HVerticalImageText extends StatelessWidget {
  const HVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = HColors.white,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: HSizes.spaceBtwItems),
        child: Column(
          children: [
            /// -- Category Item
            HCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: const EdgeInsets.all(HSizes.sm * 1.4),
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: isDark ? HColors.light : HColors.dark,
            ),

            const SizedBox(height: HSizes.spaceBtwItems / 2),

            /// -- Category Name
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
