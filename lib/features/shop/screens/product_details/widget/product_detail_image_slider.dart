import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/h_circular_icon.dart';
import '../../../../../common/widgets/images/h_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HProductImageSlider extends StatelessWidget {
  const HProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HCurvedEdgeWidget(
      child: Container(
        color: HHelperFunctions.isDarkMode(context)
            ? HColors.darkerGrey
            : HColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(HImages.productImage1),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              left: HSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: HSizes.spaceBtwItems),
                  itemBuilder: (_, index) {
                    return HRoundImage(
                      width: 80,
                      imageUrl: HImages.productImage1,
                      padding: const EdgeInsets.all(HSizes.sm),
                      border: Border.all(color: HColors.primary),
                      backgroundColor: HHelperFunctions.isDarkMode(context)
                          ? HColors.dark
                          : HColors.white,
                    );
                  },
                ),
              ),
            ),

            /// Appbar Icons
            const HAppBar(
              showBackArrow: true,
              actions: [
                HCircularIcon(
                  icon: Iconsax.heart5,
                  iconColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
