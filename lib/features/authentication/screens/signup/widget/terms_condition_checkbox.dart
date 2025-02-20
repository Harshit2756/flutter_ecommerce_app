import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class HTermsAndConditionCheckbox extends StatelessWidget {
  const HTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final isDark = HHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: HSizes.defaultSpace,
          height: HSizes.defaultSpace,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              /// I agree to
              TextSpan(
                text: '${HTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              /// Privacy Policy
              TextSpan(
                text: '${HTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: isDark ? HColors.white : HColors.primary,
                      decorationColor: isDark ? HColors.white : HColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),

              /// and
              TextSpan(
                text: '${HTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              /// Terms and Conditions
              TextSpan(
                text: HTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: isDark ? HColors.white : HColors.primary,
                      decorationColor: isDark ? HColors.white : HColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
