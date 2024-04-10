import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

import '../../../features/authentication/screens/onboarding/onboarding_screen.dart';

class AuthenticatorRepository extends GetxController {
  static AuthenticatorRepository get intance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenredirect();
  }

  /// Function to Show Relevant Screen
  screenredirect() async {
    // Local Storage

    if (kDebugMode) {
      print(
          '===================== Get Storage Auth Repo =====================');
      print('IsFirstTime: ${deviceStorage.read('IsFirstTime')}');
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}
