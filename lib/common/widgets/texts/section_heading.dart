import 'package:flutter/material.dart';

class HSectionHeading extends StatelessWidget {
  const HSectionHeading({
    super.key,
    this.textColor,
    this.onButtonTap,
    required this.title,
    this.showActionButton = true,
    this.buttonTitle = 'View All',
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onButtonTap, child: Text(buttonTitle)),
      ],
    );
  }
}
