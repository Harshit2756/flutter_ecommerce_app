import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final sortFilters = [
      'Name',
      'Higher Price',
      'Lower Price',
      'Newest',
      'Popular',
      'Sale',
    ];
    return Scaffold(
      appBar: const HAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                items: sortFilters
                    .map((options) =>
                        DropdownMenuItem(value: options, child: Text(options)))
                    .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Products
              HGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => const HProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
