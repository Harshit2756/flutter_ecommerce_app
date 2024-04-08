import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class HBillingPaymentsSection extends StatelessWidget {
  const HBillingPaymentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onButtonTap: () {},
        ),
        const SizedBox(height: HSizes.spaceBtwItems / 2),
        Row(
          children: [
            HRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDark ? HColors.light : HColors.white,
              child: const Image(
                image: AssetImage(HImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: HSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
