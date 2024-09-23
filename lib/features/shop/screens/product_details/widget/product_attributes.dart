import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_title.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class HProductAttributes extends StatelessWidget {
  const HProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        HRoundedContainer(
          padding: const EdgeInsets.all(HSizes.md),
          backgroundColor: HHelperFunctions.isDarkMode(context)
              ? HColors.darkerGrey
              : HColors.grey,
          child: Column(
            children: [
              /// -- Title, Price & Stock Status
              Row(
                children: [
                  const HSectionHeading(
                    title: 'Varitation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: HSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const HProductTitleText(
                              title: 'Price : ', smallSize: true),

                          /// Actual Price
                          Text(
                            '\$200',
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          const SizedBox(width: HSizes.spaceBtwItems),

                          /// Sale Price
                          const HProductPriceText(price: '200'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const HProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// -- variation Description
              const HProductTitleText(
                title:
                    'This is the Description of the product and it can go upto max 4 lines',
                maxLines: 4,
                smallSize: true,
              ),
            ],
          ),
        ),

        const SizedBox(height: HSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: HSizes.spaceBtwItems),
            Wrap(
              spacing: HSizes.spaceBtwItems / 2,
              children: [
                HChoiceChip(
                    isSelected: true, text: 'Yellow', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: false, text: 'Blue', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: true, text: 'Green', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: true, text: 'Yellow', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: false, text: 'Blue', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: true, text: 'Green', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: true, text: 'Yellow', onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(height: HSizes.spaceBtwItems),
            Wrap(
              spacing: HSizes.spaceBtwItems / 2,
              children: [
                HChoiceChip(
                    isSelected: true, text: 'EU 40', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: false, text: 'EU 38', onSelected: (value) {}),
                HChoiceChip(
                    isSelected: true, text: 'EU 34', onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
