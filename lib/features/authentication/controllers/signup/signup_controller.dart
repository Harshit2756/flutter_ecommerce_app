// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';

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

  /// Focus Nodes
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  /// Formaters
  final List<FilteringTextInputFormatter> nameFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
  ];
  final List<FilteringTextInputFormatter> emailFormatter = [
    FilteringTextInputFormatter.deny(RegExp(r'[ ]'))
  ];
  final List<FilteringTextInputFormatter> passwordFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.!@#\$&*~]'))
  ];
  final List<FilteringTextInputFormatter> phoneNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
  ];
  final List<FilteringTextInputFormatter> userNameFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
  ];

  /// -- SignUP
  void signUp() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'We are Processing your information....',
        HImages.docerAnimation,
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
      Get.to(() => VerifyEmailScreen(email: emailController.text.trim()));
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }
}
