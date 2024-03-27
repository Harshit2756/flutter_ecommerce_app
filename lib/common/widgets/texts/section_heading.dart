import 'package:flutter/material.dart';

class HSectionHeading extends StatelessWidget {
  const HSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.buttonTitle = 'View All',
    this.onButtonTap,
    this.showActionButton = true,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Row(
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
