import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widget/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payments_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const HCartItems(showAddRemoveButtons: false),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// -- Coupon TextField
              const HCouponCode(),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// -- Billing Section
              HRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(HSizes.md),
                backgroundColor: isDark ? HColors.black : HColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    HBillingAmountSection(),
                    SizedBox(height: HSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: HSizes.spaceBtwItems),

                    /// payment Methods
                    HBillingPaymentsSection(),

                    /// Address
                    HBillingAddressSection(),
                    SizedBox(height: HSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => HSuccessScreen(
              image: HImages.successfulPaymentIcon,
              title: 'Payment Successful',
              subtitile: 'Your item will be shipped soon.',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
