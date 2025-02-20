import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class HSortableProducts extends StatelessWidget {
  const HSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Newest',
            'Popular',
            'Price: Low to High',
            'Price: High to Low'
          ]
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
    );
  }
}
