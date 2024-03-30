import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/h_circular_image.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/h_brand_title_text_with_verified_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          HCartCounterIcon(onCartTap: () {}),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: isDark ? HColors.black : HColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(HSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// -- Search bar
                    const SizedBox(height: HSizes.spaceBtwItems),
                    const HSearchContainer(
                      text: 'Search in Store',
                      showBorder: true,
                      showbackground: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: HSizes.spaceBtwSections),

                    /// -- Freatured Brands Heading
                    HSectionHeading(
                        title: 'Feature Brands', onButtonTap: () {}),
                    const SizedBox(height: HSizes.spaceBtwItems / 1.5),

                    /// -- Brands List
                    HGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: HRoundedContainer(
                            padding: const EdgeInsets.all(HSizes.sm),
                            showBorder: true,
                            backgroundColor: HColors.transparent,
                            child: Row(
                              children: [
                                /// -- Icon
                                Flexible(
                                  child: HCircularImage(
                                    image: HImages.clothIcon,
                                    backgroundColor: HColors.transparent,
                                    overlayColor:
                                        isDark ? HColors.white : HColors.black,
                                  ),
                                ),
                                const SizedBox(width: HSizes.spaceBtwItems / 2),

                                /// -- Text
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const HBrandTileWithVerifiedIcon(
                                        title: 'Nike',
                                        brandTextSize: TextSizes.large,
                                      ),
                                      Text(
                                        "256 Products are there in the store",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
