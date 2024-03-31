import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import 'social_action_button.dart';

class HSocialButtons extends StatelessWidget {
  const HSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HCircularSocialButton(
          onpressed: () {},
          image: HImages.google,
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        HCircularSocialButton(
          onpressed: () {},
          image: HImages.facebook,
        ),
      ],
    );
  }
}
