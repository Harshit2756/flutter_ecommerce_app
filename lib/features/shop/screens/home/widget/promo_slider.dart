// import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/h_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controller/banner_controller.dart';

class HPromoSlider extends StatelessWidget {
  const HPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              controller.updatePageIndecator(index);
            },
          ),
          items: banners.map((url) => HRoundImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: HSizes.spaceBtwSections),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                HRoundedContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.currentIndex.value == i
                      ? HColors.primary
                      : HColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
