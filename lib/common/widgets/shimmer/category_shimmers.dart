import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
=======
import 'package:style_hub/common/widgets/shimmer/shimmer.dart';
>>>>>>> 4129d0a92fdceee4d225d1f6c8b17793a30f28da

import '../../../utils/constants/sizes.dart';

class HCategoryShimmer extends StatelessWidget {
  const HCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: HSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              HShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: HSizes.spaceBtwItems / 2),

              /// Text
              HShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
