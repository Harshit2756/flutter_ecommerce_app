import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularIcon extends StatelessWidget {
  const HCircularIcon({
    super.key,
    this.width,
    this.height,
    this.iconSize = HSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, iconSize;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : HHelperFunctions.isDarkMode(context)
                ? HColors.black.withOpacity(0.9)
                : HColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: iconSize,
          color: color,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
