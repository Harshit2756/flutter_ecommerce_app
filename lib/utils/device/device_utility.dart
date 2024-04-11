import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Device Utility class to provide device specific utility methods.
///  - hideKeyboard: Hides the keyboard.
///  - setStatusBarColor: Sets the status bar color.
///  - isLandscapeOrientation: Checks if the device is in landscape orientation.
///  - isPortraitOrientation: Checks if the device is in portrait orientation.
///  - setFullScreen: Sets the app to full screen mode.
///  - getScreenHeight: Gets the screen height.
///  - getScreenWidth: Gets the screen width.
///  - getPixelRatio: Gets the device pixel ratio.
///  - getStatusBarHeight: Gets the status bar height.
///  - getBottomNavigationBarHeight: Gets the bottom navigation bar height.
///  - getAppBarHeight: Gets the app bar height.
///  - getKeyboardHeight: Gets the keyboard height.
///  - isKeyboardVisible: Checks if the keyboard is visible.
///  - isPhysicalDevice: Checks if the device is a physical device
///  - vibrate: Vibrates the device.
///  - setPreferredOrientations: Sets the preferred orientations.
///  - hideStatusBar: Hides the status bar.
///  - showStatusBar: Shows the status bar.
///  - hasInternetConnection: Checks if the device has an internet connection.
///  - isIOS: Checks if the device is an iOS device.
///  - isAndroid: Checks if the device is an Android device.
///  - launchUrl: Launches a URL.
///  - isDarkMode: Checks if the device is in dark mode.
class HDeviceUtils {
  /// Hides the keyboard.
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Sets the status bar color.
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Checks if the device is in landscape orientation.
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Checks if the device is in portrait orientation.
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// Sets the app to full screen mode.
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// Gets the screen height.
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Gets the screen width.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the device pixel ratio.
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// Gets the status bar height.
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// Gets the bottom navigation bar height.
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Gets the app bar height.
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Gets the keyboard height.
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// Checks if the keyboard is visible.
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// Checks if the device is a physical device
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Vibrates the device.
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Sets the preferred orientations.
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Hides the status bar.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Shows the status bar.
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  /// Checks if the device has an internet connection.
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Checks if the device is an iOS device.
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Checks if the device is an Android device.
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Launches a URL.
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Checks if the device is in dark mode.
  static isDarkMode(BuildContext context) {}
}
