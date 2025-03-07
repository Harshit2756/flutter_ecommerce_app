import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance {
    return Get.find();
  }

  /// Variable
  final pageController = PageController();
  final Rx<int> currentPage = 0.obs;

  /// Update current page Index
  void updatePageIncdicator(index) => currentPage.value = index;

  /// Jump to to specific dot Selected page.
  void dotNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current page Index
  void nextPage(BuildContext context) {
    if (currentPage.value == 2) {
      final deviceStorage = GetStorage();
      if (kDebugMode) {
        print(
            '===================== Get Storage Next Butoon =====================');
        print('IsFirstTime: ${deviceStorage.read('IsFirstTime')}');
      }

      deviceStorage.write('IsFirstTime', false);

      if (kDebugMode) {
        print(
            '===================== Get Storage Next Butoon =====================');
        print('IsFirstTime: ${deviceStorage.read('IsFirstTime')}');
      }

      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPage.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Navigate to Last Page
  void skipPage(BuildContext context) {
    currentPage.value = 2;

    Get.offAll(() => const LoginScreen());
  }
}
