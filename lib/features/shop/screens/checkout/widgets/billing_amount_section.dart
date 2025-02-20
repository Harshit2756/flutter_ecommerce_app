import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class HBillingAmountSection extends StatelessWidget {
  const HBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$10', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: HSizes.spaceBtwItems / 2),

        /// Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: HSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$266', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
