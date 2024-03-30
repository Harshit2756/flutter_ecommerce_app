import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularImage extends StatelessWidget {
  const HCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    required this.image,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = HSizes.sm,
    this.isNetworkImage = false,
  });

  final double width, height, padding;
  final Color? overlayColor, backgroundColor;
  final String image;
  final bool isNetworkImage;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: HHelperFunctions.isDarkMode(context)
            ? HColors.black
            : HColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
