import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_hub/common/widgets/appbar/appbar.dart';

import '../../../../utils/constants/sizes.dart';
import '../checkout/checkout.dart';
import 'widget/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(HSizes.defaultSpace),
        child: HCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
