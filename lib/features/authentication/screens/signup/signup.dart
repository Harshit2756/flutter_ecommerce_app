import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_hub/common/widgets/login_signup/form_divider.dart';
import 'package:style_hub/common/widgets/login_signup/social_buttons.dart';
import 'package:style_hub/utils/constants/sizes.dart';
import 'package:style_hub/utils/constants/text_strings.dart';

import 'widget/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Signup Title
              Text(
                HTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: HSizes.defaultSpace),

              /// Signup Form
              const HSignupForm(),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Divider
              HFormDivider(dividerText: HTexts.orSignUpWith.capitalize!),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Social Media Signup Buttons
              const HSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
