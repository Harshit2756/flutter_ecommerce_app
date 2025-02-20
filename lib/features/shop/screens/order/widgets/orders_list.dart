import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HOrderListItems extends StatelessWidget {
  const HOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: HSizes.spaceBtwItems),
      itemBuilder: (_, index) => HRoundedContainer(
        showBorder: true,
        backgroundColor:
            HHelperFunctions.isDarkMode(context) ? HColors.dark : HColors.light,
        padding: const EdgeInsets.all(HSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row-1
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: HSizes.spaceBtwItems / 2),

                /// Status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: HColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '01 Jan 2021',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                /// Order Details Button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.arrow_right_34, size: HSizes.iconSm),
                ),
              ],
            ),
            const SizedBox(height: HSizes.spaceBtwItems),
            // Row-2
            Row(
              children: [
                /// Order Id
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.discount_circle),
                      const SizedBox(width: HSizes.spaceBtwItems / 2),

                      /// Order Id
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              'CWT0012',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Shipping Date
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: HSizes.spaceBtwItems / 2),

                      /// Shipping Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '01 Jan 2021',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
