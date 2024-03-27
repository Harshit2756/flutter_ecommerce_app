import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HVerticalImageText extends StatelessWidget {
  const HVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = HColors.white,
    this.backgroundColor = HColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
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
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(HSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (isDark ? HColors.dark : HColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                color: isDark ? HColors.light : HColors.dark,
              ),
            ),

            /// -- Category Name
            const SizedBox(height: HSizes.spaceBtwItems / 2),

            SizedBox(
              width: 56,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: textColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
