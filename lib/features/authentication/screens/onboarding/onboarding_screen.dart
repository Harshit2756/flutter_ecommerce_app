import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIncdicator,
            children: const [
              OnBoardingPage(
                subTitle: HTexts.onBoardingSubTitle1,
                image: HImages.onBoardingImage1,
                title: HTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                subTitle: HTexts.onBoardingSubTitle2,
                image: HImages.onBoardingImage2,
                title: HTexts.onBoardingTitle2,
              ),
              OnBoardingPage(
                subTitle: HTexts.onBoardingSubTitle3,
                image: HImages.onBoardingImage3,
                title: HTexts.onBoardingTitle3,
              ),
            ],
          ),

          ///  Skip button
          const OnBoardingSkip(),

          /// Dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
