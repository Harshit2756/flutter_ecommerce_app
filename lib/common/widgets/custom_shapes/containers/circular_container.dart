import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class HCircularContainer extends StatelessWidget {
  const HCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding = 0,
    this.radius = 400,
    this.child,
    this.backgroundColor = HColors.white,
  });

  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
