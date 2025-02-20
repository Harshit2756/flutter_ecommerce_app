import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/review_details_container.dart';
import 'widgets/rating_progress_indicator.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- App Bar
      appBar: const HAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      ///
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// overall Product Rating
              const HOverallProductRatings(),

              /// -- Rating Progress Indicator
              const HRatingBarIndicator(rating: 4.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// User Reviews List
              const UserRieviewCard(),
              const UserRieviewCard(),
              const UserRieviewCard(),
              const UserRieviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
