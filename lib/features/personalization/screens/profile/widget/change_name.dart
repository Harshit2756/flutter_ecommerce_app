import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: HAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Use real name so your friends can recognize you.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: HSizes.spaceBtwSections),

            /// TextFields and Button
            Form(
              key: controller.updateUSerNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        HValidator.validateEmptyText(HTexts.firstName, value),
                    decoration: const InputDecoration(
                      labelText: HTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                      hintText: 'Enter your first name',
                    ),
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        HValidator.validateEmptyText(HTexts.lastName, value),
                    decoration: const InputDecoration(
                      labelText: HTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                      hintText: 'Enter your last name',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: HSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
