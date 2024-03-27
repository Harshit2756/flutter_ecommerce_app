import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import 'social_action_button.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularSocialButton(
          onpressed: () {},
          image: HImages.google,
        ),
        const SizedBox(width: HSizes.spaceBtwItems),
        CircularSocialButton(
          onpressed: () {},
          image: HImages.facebook,
        ),
      ],
    );
  }
}
