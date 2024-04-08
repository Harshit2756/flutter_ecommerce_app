import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class HCouponCode extends StatelessWidget {
  const HCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);

    return HRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? HColors.dark : HColors.white,
      padding: const EdgeInsets.only(
        left: HSizes.md,
        right: HSizes.sm,
        top: HSizes.sm,
        bottom: HSizes.sm,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? HColors.white.withOpacity(0.5)
                    : HColors.dark.withOpacity(0.5),
                backgroundColor: HColors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: HColors.grey.withOpacity(0.1),
                ),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
