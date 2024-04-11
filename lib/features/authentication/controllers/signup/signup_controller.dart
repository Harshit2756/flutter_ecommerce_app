// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variales
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final emailController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SignUP
  void signUp() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'We are Processing your information....',
        HImages.loaderAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        HLoarders.waringSnackBar(
          title: 'Accept Privacy Policy',
          message: 'Please accept the privacy policy to continue',
        );
        return;
      }

      // Register User in Firebase Auth and save user data in Firestore
      final userCredential =
          await AuthenticatorRepository.instance.registerWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Save Authenticated User Data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        userName: userNameController.text.trim(),
        profilePicture: '',
      );

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserRecord(newUser);

      HFullScreenLoader.stopLoading();

      // Show Success Message
      HLoarders.successSnackBar(
        title: 'Congratulations!',
        message:
            'Your account has been created successfully! Verify your email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }
}
