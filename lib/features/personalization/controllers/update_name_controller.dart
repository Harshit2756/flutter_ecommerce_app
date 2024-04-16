import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:style_hub/utils/constants/image_strings.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import 'user_controller.dart';
import '../screens/profile/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUSerNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen is loaded
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  /// Fetch User Details
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'We are updating your information....',
        HImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUSerNameFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Update User firstName and lastName in the Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update User firstName and lastName in the UserController
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Show Success SnackBar
      HLoarders.successSnackBar(
        title: 'Congratulations!',
        message: 'Your name has been updated successfully.',
      );

      // Redirect to the relevant screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }
}
