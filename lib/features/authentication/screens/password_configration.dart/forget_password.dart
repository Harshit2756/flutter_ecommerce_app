import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text(
                HTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              Text(
                HTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: HSizes.spaceBtwSections * 2),

              /// Email Field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: HValidator.validateEmail,
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: HTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendResetPasswordResetEmail(),
                  child: const Text(HTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
