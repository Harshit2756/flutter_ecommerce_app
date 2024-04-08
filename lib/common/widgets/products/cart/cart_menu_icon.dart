import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/h_circular_icon.dart';

class HProductQuantityWithAddRemoveButton extends StatelessWidget {
  const HProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          iconSize: HSizes.md,
          backgroundColor: HHelperFunctions.isDarkMode(context)
              ? HColors.darkGrey
              : HColors.light,
          iconColor: HHelperFunctions.isDarkMode(context)
              ? HColors.white
              : HColors.black,
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: HSizes.spaceBtwItems),
        const HCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          iconSize: HSizes.md,
          iconColor: HColors.white,
          backgroundColor: HColors.primary,
        ),
      ],
    );
  }
}
