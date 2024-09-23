import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set TImer for auto redirect.
  @override
  void onInit() {
    super.onInit();
    // Send Email
    sendEmailVerification();
    // Set Timer
    setTimerForAutoRedirect();
  }

  sendEmailVerification() async {
    try {
      await AuthenticatorRepository.instance.sendEmailVerification();
      HLoarders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your email and verify your email.');
    } catch (e) {
      HLoarders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => HSuccessScreen(
              image: HImages.successfullyRegisterAnimation,
              title: HTexts.yourAccountCreatedTitle,
              subtitile: HTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticatorRepository.instance.screenredirect(),
            ),
          );
        }
      },
    );
  }

  /// Manually Check if Email is Verified
  checkVerificationState() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => HSuccessScreen(
          image: HImages.successfullyRegisterAnimation,
          title: HTexts.yourAccountCreatedTitle,
          subtitile: HTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticatorRepository.instance.screenredirect(),
        ),
      );
    }
  }
}
