import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class HRoundedContainer extends StatelessWidget {
  const HRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = HSizes.cardRadiusLg,
    this.backgroundColor = HColors.white,
    this.borderColor = HColors.borderPrimary,
  });

  final Widget? child;
  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
