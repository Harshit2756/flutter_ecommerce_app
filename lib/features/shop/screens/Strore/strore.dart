import 'package:flutter/material.dart';

import 'widget/category_tab.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/brands/h_brand_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: HAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            HCartCounterIcon(),
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
                          return const HBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabbar
                bottom: const HTabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },

          /// -- Body Tabbar View
          body: const TabBarView(
            children: [
              HCategoryTab(),
              HCategoryTab(),
              HCategoryTab(),
              HCategoryTab(),
              HCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
