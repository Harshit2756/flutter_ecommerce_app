import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';

/// A widget for displaying an animated loading indicator with optional text and action button.
class HAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final String? actionText;
  final VoidCallback? onActionTap;
  final bool showAction;

  /// Default constructor for the HAnimationLoaderWidget.
  ///
  /// Parameters:
  ///  - text: The text to display below the animation.
  ///  - animation: The path to the Lottie animation file.
  ///  - showAction: A boolean value to determine if the action button should be displayed.
  ///  - actionText: The text to display on the action button.
  ///  - onActionTap: The callback to execute when the action button is tapped.
  const HAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.actionText,
    this.onActionTap,
    this.showAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: HDeviceUtils.getScreenWidth(context) * 0.8,
          ),
          const SizedBox(height: HSizes.defaultSpace),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: HSizes.defaultSpace),
          if (showAction)
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: onActionTap,
                style: OutlinedButton.styleFrom(backgroundColor: HColors.dark),
                child: Text(
                  actionText ?? 'Retry',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: HColors.light),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
