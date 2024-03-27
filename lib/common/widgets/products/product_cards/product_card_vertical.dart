import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../styles/shadows.dart';
import '../../icons/h_circular_icon.dart';
import '../../images/h_rounded_images.dart';
import '../../texts/product_price_title.dart';
import '../../texts/product_title_text.dart';

class HProductCardVertical extends StatelessWidget {
  const HProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [HShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(HSizes.productImageRadius),
          color: isDark ? HColors.darkerGrey : HColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail , wishList Button , Discount Tag
            HRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(HSizes.sm),
              backgroundColor: isDark ? HColors.dark : HColors.light,
              child: Stack(
                /// -- Thumbnail Image
                children: [
                  const HRoundImage(
                    imageUrl: HImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// -- Discount Tag
                  Positioned(
                    top: 12,
                    child: HRoundedContainer(
                      radius: HSizes.sm,
                      backgroundColor: HColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: HSizes.sm,
                        vertical: HSizes.xs,
                      ),
                      child: Text(
                        '20% OFF',
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: HColors.black,
                            ),
                      ),
                    ),
                  ),

                  /// -- Favorite Icon Button
                  const Positioned(
                    right: 0,
                    top: 0,
                    child:
                        TcircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: HSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Product Name
                  const HProductTitleText(
                    title: 'Green Nike Air Max',
                    smallSize: true,
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: HSizes.spaceBtwItems / 4),
                      const Icon(
                        Iconsax.verify5,
                        size: HSizes.iconXs,
                        color: HColors.primary,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// -- Price
                      const HProductPriceText(price: '120'),

                      /// -- Add to Cart Button
                      Container(
                          decoration: const BoxDecoration(
                            color: HColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(HSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(HSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                            width: HSizes.iconLg * 1.2,
                            height: HSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: HColors.white,
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
