import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance {
    return Get.find();
  }

  /// Variable
  final pageController = PageController();
  final Rx<int> _currentPage = 0.obs;

  /// Update current page Index
  void updatePageIncdicator(index) => _currentPage.value = index;

  /// Jump to to specific dot Selected page.
  void dotNavigationClick(index) {
    _currentPage.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current page Index
  void nextPage(BuildContext context) {
    if (_currentPage.value == 2) {
      Get.offAll(() => const LoginScreen());
    } else {
      int page = _currentPage.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Navigate to Last Page
  void skipPage(BuildContext context) {
    _currentPage.value = 2;
    Get.offAll(() => const LoginScreen());
  }
}
