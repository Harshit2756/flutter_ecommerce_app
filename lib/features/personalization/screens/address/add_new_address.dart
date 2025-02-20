import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Name', prefixIcon: Icon(Iconsax.user))),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Iconsax.mobile))),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Street',
                              prefixIcon: Icon(Iconsax.building_31))),
                    ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Postal Code',
                              prefixIcon: Icon(Iconsax.code))),
                    ),
                  ],
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'City',
                              prefixIcon: Icon(Iconsax.building))),
                    ),
                    const SizedBox(width: HSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'State',
                              prefixIcon: Icon(Iconsax.activity))),
                    ),
                  ],
                ),
                const SizedBox(height: HSizes.spaceBtwInputFields),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Country',
                        prefixIcon: Icon(Iconsax.global))),
                const SizedBox(height: HSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save Address'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
