import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configration.dart/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final emailController = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendResetPasswordResetEmail() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Processing your reguest....',
        HImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }
      // send Password Reset Email
      await AuthenticatorRepository.instance
          .sendPasswordResetEmail(emailController.text.trim());

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Show Success SnackBar
      HLoarders.successSnackBar(
          title: 'Email Sent',
          message:
              'An email has been sent to ${emailController.text.trim()} with instructions on how to reset your password.');

      // Redirect to the relevant screen
      Get.to(() => ResetPassword(email: emailController.text.trim()));
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }

  resendResetPasswordResetEmail(String email) async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Processing your reguest....',
        HImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // send Password Reset Email
      await AuthenticatorRepository.instance
          .sendPasswordResetEmail(emailController.text.trim());

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Show Success SnackBar
      HLoarders.successSnackBar(
          title: 'Email Sent',
          message:
              'An email has been sent to ${emailController.text.trim()} with instructions on how to reset your password.');
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }
}
