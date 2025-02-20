import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../shimmer/shimmer.dart';

class HCircularImage extends StatelessWidget {
  const HCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    required this.image,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = const EdgeInsets.all(HSizes.sm),
    this.isNetworkImage = false,
  });

  final double width, height;
  final EdgeInsetsGeometry padding;
  final Color? overlayColor, backgroundColor;
  final String image;
  final bool isNetworkImage;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: HHelperFunctions.isDarkMode(context)
              ? HColors.black
              : HColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const HShimmerEffect(
                      width: 55,
                      height: 55,
                      radius: 55,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(image),
                    color: overlayColor,
                  ),
          ),
        ));
  }
}
