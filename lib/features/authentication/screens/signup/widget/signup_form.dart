import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'terms_condition_checkbox.dart';

class HSignupForm extends StatelessWidget {
  const HSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// User First and Last Name
          Row(
            children: [
              /// First Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  validator: (value) =>
                      HValidator.validateEmptyText(HTexts.firstName, value),
                  controller: controller.firstNameController,
                  decoration: const InputDecoration(
                    labelText: HTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: HSizes.spaceBtwInputFields),

              /// User Last Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  validator: (value) =>
                      HValidator.validateEmptyText(HTexts.lastName, value),
                  controller: controller.lastNameController,
                  decoration: const InputDecoration(
                    labelText: HTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            validator: (value) =>
                HValidator.validateEmptyText(HTexts.username, value),
            controller: controller.userNameController,
            decoration: const InputDecoration(
              labelText: HTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            validator: HValidator.validateEmail,
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: HTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            validator: (value) => HValidator.validatePhoneNumber(value),
            controller: controller.phoneNumberController,
            decoration: const InputDecoration(
              labelText: HTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              validator: (value) => HValidator.validatePassword(value),
              controller: controller.passwordController,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: HTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Terms and Conditions checkbox
          const HTermsAndConditionCheckbox(),

          const SizedBox(height: HSizes.spaceBtwSections),

          /// Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: const Text(HTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
