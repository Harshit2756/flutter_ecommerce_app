import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/navigation_menu.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configration.dart/forget_password.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: HTexts.email,
                hintText: HTexts.email,
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: HTexts.password,
                hintText: HTexts.password,
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwItems / 2),

            /// Remember me and Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Rremember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(HTexts.rememberMe),
                  ],
                ),

                /// Forgot password
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text(HTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: HSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const NavigationMenu());
                },
                child: const Text(HTexts.signIn),
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwItems),

            /// Create Account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(HTexts.createAccount),
              ),
            ),
            const SizedBox(height: HSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
