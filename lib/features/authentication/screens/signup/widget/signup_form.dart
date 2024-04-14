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
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  inputFormatters: controller.nameFormatter,
                  focusNode: controller.firstNameFocusNode,
                  expands: false,
                  validator: (value) =>
                      HValidator.validateEmptyText(HTexts.firstName, value),
                  controller: controller.firstNameController,
                  decoration: const InputDecoration(
                    labelText: HTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  onFieldSubmitted: (value) {
                    controller.firstNameFocusNode.unfocus();
                    controller.lastNameFocusNode.requestFocus();
                  },
                ),
              ),
              const SizedBox(width: HSizes.spaceBtwInputFields),

              /// User Last Name
              Expanded(
                child: TextFormField(
                  expands: false,
                  focusNode: controller.lastNameFocusNode,
                  inputFormatters: controller.nameFormatter,
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      HValidator.validateEmptyText(HTexts.lastName, value),
                  controller: controller.lastNameController,
                  decoration: const InputDecoration(
                    labelText: HTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  onFieldSubmitted: (value) {
                    controller.lastNameFocusNode.unfocus();
                    controller.userNameFocusNode.requestFocus();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            inputFormatters: controller.userNameFormatter,
            keyboardType: TextInputType.name,
            focusNode: controller.userNameFocusNode,
            validator: (value) =>
                HValidator.validateEmptyText(HTexts.username, value),
            controller: controller.userNameController,
            decoration: const InputDecoration(
              labelText: HTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
            onFieldSubmitted: (value) {
              controller.userNameFocusNode.unfocus();
              controller.emailFocusNode.requestFocus();
            },
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            inputFormatters: controller.emailFormatter,
            focusNode: controller.emailFocusNode,
            validator: HValidator.validateEmail,
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: HTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            onFieldSubmitted: (value) {
              controller.emailFocusNode.unfocus();
              controller.phoneNumberFocusNode.requestFocus();
            },
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            keyboardType: TextInputType.phone,
            focusNode: controller.phoneNumberFocusNode,
            inputFormatters: controller.phoneNumberFormatter,
            validator: (value) => HValidator.validatePhoneNumber(value),
            controller: controller.phoneNumberController,
            decoration: const InputDecoration(
              labelText: HTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
            onFieldSubmitted: (value) {
              controller.phoneNumberFocusNode.unfocus();
              controller.passwordFocusNode.requestFocus();
            },
          ),

          const SizedBox(height: HSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              focusNode: controller.passwordFocusNode,
              inputFormatters: controller.passwordFormatter,
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
              onFieldSubmitted: (value) {
                controller.passwordFocusNode.unfocus();
              },
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
