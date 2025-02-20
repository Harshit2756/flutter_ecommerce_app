import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/image_strings.dart';
import 'social_action_button.dart';

class HSocialButtons extends StatelessWidget {
  const HSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HCircularSocialButton(
          onpressed: () => controller.googleSignIn(),
          image: HImages.google,
        ),
        // const SizedBox(width: HSizes.spaceBtwItems),
        // HCircularSocialButton(
        //   onpressed: () {},
        //   image: HImages.facebook,
        // ),
      ],
    );
  }
}
