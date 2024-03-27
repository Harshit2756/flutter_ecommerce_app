import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/home_appbar.dart';
import 'widget/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Primary Header Container
            HPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar
                  HHomeAppBar(),

                  SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Search Bar
                  HSearchContainer(text: 'Search in store'),

                  SizedBox(height: HSizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: HSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Section Heading
                        HSectionHeading(
                          title: 'Popular Categories',
                          textColor: HColors.white,
                          showActionButton: false,
                        ),

                        SizedBox(height: HSizes.spaceBtwItems),

                        /// -- Categories List
                        HHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
