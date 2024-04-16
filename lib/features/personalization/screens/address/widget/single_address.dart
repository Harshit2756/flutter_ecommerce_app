import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_hub/utils/constants/sizes.dart';
import 'package:style_hub/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';

class HSingleAddress extends StatelessWidget {
  const HSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return HRoundedContainer(
      padding: const EdgeInsets.all(HSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? HColors.primary.withOpacity(0.5)
          : HColors.transparent,
      borderColor: selectedAddress
          ? HColors.transparent
          : isDark
              ? HColors.darkerGrey
              : HColors.grey,
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? isDark
                      ? HColors.light
                      : HColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: HSizes.sm / 2),
              Text(
                '+91 1234567890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: HSizes.sm / 2),
              const Text('B1001 the manor central park, Ha Noi, Viet Nam',
                  softWrap: true),
              const SizedBox(height: HSizes.sm / 2),
            ],
          )
        ],
      ),
    );
  }
}
