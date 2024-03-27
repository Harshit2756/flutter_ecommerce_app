import 'package:flutter/material.dart';

class HProductPriceText extends StatelessWidget {
  const HProductPriceText({
    super.key,
    required this.price,
    this.currency = '\$',
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });
  final String price, currency;
  final int maxLines;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currency + price,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.labelMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
