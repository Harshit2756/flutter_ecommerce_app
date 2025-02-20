import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/h_circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HBottomAddToCart extends StatelessWidget {
  const HBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.defaultSpace, vertical: HSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? HColors.darkerGrey : HColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(HSizes.cardRadiusLg),
          topRight: Radius.circular(HSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const HCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: HColors.darkGrey,
                iconColor: HColors.white,
              ),
              const SizedBox(width: HSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: HSizes.spaceBtwItems),
              const HCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: HColors.dark,
                iconColor: HColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(HSizes.md),
              backgroundColor: HColors.black,
              side: const BorderSide(color: HColors.black),
            ),
            child: const Text(
              'Add To Cart',
            ),
          ),
        ],
      ),
    );
  }
}
