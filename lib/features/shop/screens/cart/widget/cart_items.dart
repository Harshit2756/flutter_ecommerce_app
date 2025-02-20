import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/texts/product_price_title.dart';
import '../../../../../utils/constants/sizes.dart';

class HCartItems extends StatelessWidget {
  const HCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: HSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const HCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: HSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add Remove Buttons
                    HProductQuantityWithAddRemoveButton(),
                  ],
                ),
                HProductPriceText(price: '256')
              ],
            ),
        ],
      ),
    );
  }
}
