import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/texts/product_price_title.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout \$256.0'),
        ),
      ),
      appBar: HAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 16,
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: HSizes.spaceBtwSections),
          itemBuilder: (_, index) => const Column(
            children: [
              HCartItem(),
              SizedBox(height: HSizes.spaceBtwItems),
              Row(
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
        ),
      ),
    );
  }
}
