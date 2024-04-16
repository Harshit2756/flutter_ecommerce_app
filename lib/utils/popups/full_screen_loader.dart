import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_hub/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';

class HFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HHelperFunctions.isDarkMode(Get.context!)
              ? HColors.dark
              : HColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              HAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the current loading dialog.
  /// This method doesn't require any parameters.
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
