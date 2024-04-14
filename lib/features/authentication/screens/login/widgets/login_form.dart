import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configration.dart/forget_password.dart';
import '../../signup/signup.dart';

class HLoginForm extends StatelessWidget {
  const HLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              focusNode: controller.emailFocusNode,
              inputFormatters: controller.emailFormatter,
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: HValidator.validateEmail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: HTexts.email,
                hintText: HTexts.email,
              ),
              onFieldSubmitted: (value) {
                controller.emailFocusNode.unfocus();
                controller.passwordFocusNode.requestFocus();
              },
            ),
            const SizedBox(height: HSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                focusNode: controller.passwordFocusNode,
                controller: controller.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: controller.passwordFormatter,
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.hidePassword.value,
                validator: HValidator.validatePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: HTexts.password,
                  hintText: HTexts.password,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    },
                  ),
                ),
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
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = value!;
                        },
                      ),
                    ),
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
                onPressed: () => controller.emailAndPasswordSigIn(),
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
