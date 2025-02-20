import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HSearchContainer extends StatelessWidget {
  const HSearchContainer({
    super.key,
    this.onTap,
    required this.text,
    this.showBorder = true,
    this.showbackground = true,
    this.icon = Iconsax.search_normal,
    this.padding = const EdgeInsets.symmetric(horizontal: HSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showbackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: HDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(HSizes.md),
          decoration: BoxDecoration(
            color: showbackground
                ? isDark
                    ? HColors.dark
                    : HColors.light
                : HColors.transparent,
            borderRadius: BorderRadius.circular(HSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: HColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: isDark ? HColors.darkGrey : Colors.grey),
              const SizedBox(width: HSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
