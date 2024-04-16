import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_hub/common/widgets/appbar/appbar.dart';
import 'package:style_hub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:style_hub/common/widgets/texts/section_heading.dart';
import 'package:style_hub/features/personalization/screens/address/address.dart';
import 'package:style_hub/features/shop/screens/order/order.dart';
import 'package:style_hub/utils/constants/colors.dart';
import 'package:style_hub/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../shop/screens/cart/cart.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            HPrimaryHeaderContainer(
              child: Column(
                children: [
                  HAppBar(
                    title: Text(
                      'Settings',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: HColors.white),
                    ),
                  ),

                  /// -- User Profile card
                  HUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: HSizes.spaceBtwItems),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const HSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),

                  const SizedBox(height: HSizes.spaceBtwItems),

                  /// -- My Addresses
                  HSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),

                  /// My Cart
                  HSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'View your cart items',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),

                  /// -- My Orders
                  HSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'View your order history',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),

                  /// -- Bank Account
                  HSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Manage your bank account',
                    onTap: () {},
                  ),

                  /// -- My Coupons
                  HSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'View your available coupons',
                    onTap: () {},
                  ),

                  /// -- Notifications
                  HSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Manage your notifications',
                    onTap: () {},
                  ),

                  /// -- Account Privacy
                  HSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage your account privacy',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(height: HSizes.spaceBtwSections),
                  const HSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),

                  /// -- Load Data
                  HSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Load your data from the cloud',
                    onTap: () {},
                  ),

                  /// -- Geolocation
                  HSettingsMenuTile(
                    icon: Iconsax.map,
                    title: 'Geolocation',
                    subTitle: 'Enable geolocation for better results',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  /// -- Safe Mode
                  HSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Enable safe mode for secure browsing',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  /// -- HD Image Quality
                  HSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Enable HD image quality for better view',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: HSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticatorRepository.instance.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: HSizes.spaceBtwSections * 2.2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
