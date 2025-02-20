import 'package:ecommerce_app/features/shop/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../brand/all_brands.dart';
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
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
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
                          title: 'Feature Brands',
                          onButtonTap: () =>
                              Get.to(() => const AllBrandsScreen())),
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
                bottom: HTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                  
                ),
              ),
            ];
          },

          /// -- Body Tabbar View
          body: TabBarView(
            children: categories
                .map((category) => HCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
