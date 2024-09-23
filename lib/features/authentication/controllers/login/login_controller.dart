import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /// Focus Nodes
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final loginButtonFocusNode = FocusNode();

  /// Formatters
  final List<FilteringTextInputFormatter> emailFormatter = [
    FilteringTextInputFormatter.deny(RegExp(r'[ ]'))
  ];
  final List<FilteringTextInputFormatter> passwordFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.!@#\$&*~]'))
  ];

  @override
  void onInit() {
    // Check if Remember Me is enabled
    if (localStorage.read('REMEMBER_ME_EMAIL') != null &&
        localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      emailController.text = localStorage.read('REMEMBER_ME_EMAIL');
      passwordController.text = localStorage.read('REMEMBER_ME_PASSWORD');
      rememberMe.value = true;
    }
    super.onInit();
  }

  /// -- Login
  void emailAndPasswordSigIn() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Logging you in....',
        HImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailController.text.trim());
        localStorage.write(
            'REMEMBER_ME_PASSWORD', passwordController.text.trim());
      }

      // Login User using Email & Password
      // final userCredential =
      await AuthenticatorRepository.instance.loginWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Redirect to the relevant screen
      AuthenticatorRepository.instance.screenredirect();
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }

  /// -- Google Sign In
  void googleSignIn() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Logging you in....',
        HImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Login User using Google
      final userCredential =
          await AuthenticatorRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredential);

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Redirect to the relevant screen
      AuthenticatorRepository.instance.screenredirect();
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }
}
