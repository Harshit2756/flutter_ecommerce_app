import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class HBillingAddressSection extends StatelessWidget {
  const HBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = HHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onButtonTap: () {},
        ),
        Text(
          'Harshit khandelwal',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),

        /// Phone number
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: HSizes.iconSm,
            ),
            const SizedBox(width: HSizes.spaceBtwItems),
            Text('+92-317-8059525',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),

        /// Address
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: HSizes.iconSm,
            ),
            const SizedBox(width: HSizes.spaceBtwItems),
            Flexible(
              child: Text(
                'House # 123, Street , Islamabad ',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
