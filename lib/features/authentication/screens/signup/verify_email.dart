import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image.asset(
                HImages.deliveredEmailIllustration,
                width: HHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(
                HTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: HSizes.spaceBtwItems),

              Text(
                'support@email.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: HSizes.spaceBtwItems),

              Text(
                HTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      HSuccessScreen(
                        image: HImages.staticSuccessIllustration,
                        title: HTexts.yourAccountCreatedTitle,
                        subtitile: HTexts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.to(const LoginScreen()),
                      ),
                    );
                  },
                  child: const Text(HTexts.tContinue),
                ),
              ),
              const SizedBox(height: HSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    HTexts.resendEmail,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
