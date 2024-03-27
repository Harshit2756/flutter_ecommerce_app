import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HSearchContainer extends StatelessWidget {
  const HSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showbackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showbackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: HSizes.defaultSpace),
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
            border: showBorder
                ? Border.all(
                    color: HColors.grey,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: HColors.darkGrey),
              const SizedBox(width: HSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
