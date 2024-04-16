import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_hub/common/widgets/appbar/appbar.dart';
import 'package:style_hub/features/personalization/screens/address/add_new_address.dart';
import 'package:style_hub/utils/constants/colors.dart';
import 'package:style_hub/utils/constants/sizes.dart';

import 'widget/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: HColors.white),
      ),
      appBar: HAppBar(
        title: Text(
          'Addressess',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(height: HSizes.spaceBtwItems),
              HSingleAddress(selectedAddress: true),
              HSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
