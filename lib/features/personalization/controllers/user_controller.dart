import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/profile/widget/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Get User Details
    fetchUserDetails();
  }

  /// Fetch User Details
  Future<void> fetchUserDetails() async {
    try {
      profileLoading(true);
      // fetch user details from firebase
      final currentUser = await userRepository.fetchUserDetails();
      user(currentUser);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  /// Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update Rx User and then check if user data is already stored. if not store new data.
      fetchUserDetails();

      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert Name to First Name and Last Name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');

          // Create User Model
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save User Record in firebase
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      HLoarders.waringSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(HSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action cannot be undone and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: HSizes.lg,
          ),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  void deleUserAccount() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Processing....',
        HImages.docerAnimation,
      );

      /// First Re-Authenticate User
      final auth = AuthenticatorRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          HFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          HFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }

  /// Re-Authenticate User
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Processing....',
        HImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticatorRepository.instance.reAuthenticateEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      AuthenticatorRepository.instance.deleteAccount();

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Redirect to the relevant screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }

  /// Image Source Popup
  Future<ImageSource?> showImageSourceSelection() async {
    return await showModalBottomSheet<ImageSource>(
      context: Get.context!, // Get the current context using GetX
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Get.back(result: ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Get.back(result: ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Upload Provife Image
  uploadUserProfilePicture() async {
    try {
      final ImageSource? source = await showImageSourceSelection();
      if (source == null) return;
      final pickedImage = await ImagePicker().pickImage(
        source: source,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (pickedImage != null) {
        final croppedImage = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: 'Cropper',
            ),
          ],
        );

        if (croppedImage != null) {
          imageUploading(true);

          final xFile = XFile(croppedImage.path);
          // Upload Image
          final imageUrl =
              await userRepository.uploadImage('Users/Images/Profile/', xFile);

          // Update User Profile Picture
          Map<String, dynamic> data = {'profilePicture': imageUrl};
          await userRepository.updateSingleField(data);

          user.value.profilePicture = imageUrl;
          user.refresh();
          HLoarders.successSnackBar(
            title: 'Profile Picture Updated',
            message: 'Your Profile Picture has been updated successfully.',
          );
        }
      }
    } catch (e) {
      HLoarders.errorSnackBar(
        title: 'Profile Picture Update Failed',
        message: 'Something went wrong : $e',
      );
    } finally {
      imageUploading(false);
    }
  }
}
