import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularIcon extends StatelessWidget {
  final double? width, height, iconSize;

  final IconData icon;
  final Color? iconColor, backgroundColor;
  final VoidCallback? onPressed;
  const HCircularIcon({
    super.key,
    this.width,
    this.height,
    this.iconSize = HSizes.lg,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : HHelperFunctions.isDarkMode(context)
                ? HColors.black.withValues(alpha: 0.9)
                : HColors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          icon: Icon(icon, size: iconSize, color: iconColor),
          onPressed: onPressed),
    );
  }
}
