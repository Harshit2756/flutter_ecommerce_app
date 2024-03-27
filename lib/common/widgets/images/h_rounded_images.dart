import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class HRoundImage extends StatelessWidget {
  const HRoundImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.borderRadius = HSizes.md,
    this.backgroundColor = HColors.light,
  });

  final BoxFit fit;
  final String imageUrl;
  final BoxBorder? border;
  final double borderRadius;
  final Color backgroundColor;
  final double? width, height;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool applyImageRadius, isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(HSizes.md)
              : BorderRadius.zero,
          child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit),
        ),
      ),
    );
  }
}
