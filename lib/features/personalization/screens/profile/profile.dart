import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecommerce_app/utils/formatters/formatter.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/h_circular_image.dart';
import '../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import 'widget/change_name.dart';
import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const HAppBar(showBackArrow: true, title: Text("Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : HImages.user;
                        return controller.imageUploading.value
                            ? const HShimmerEffect(
                                width: 80,
                                height: 80,
                                radius: 80,
                              )
                            : HCircularImage(
                                image: image,
                                isNetworkImage: networkImage.isNotEmpty,
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(0),
                              );
                      },
                    ),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: HSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// -- Heading Profile Information
              const HSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwItems),

              HProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onTap: () => Get.to(() => const ChangeName()),
              ),

              HProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onTap: () {},
              ),

              const SizedBox(height: HSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems),

              /// -- Heading Personal Information
              const HSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: HSizes.spaceBtwItems),

              HProfileMenu(
                title: 'UserID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onTap: () {
                  // how to copy text to clipboard in flutter
                  //  write the code

                  Get.snackbar(
                    'User ID',
                    'User ID copied to clipboard',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),

              HProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onTap: () {},
              ),

              HProfileMenu(
                title: 'Phone',
                value: HFormatter.formatPhoneNumber(
                    controller.user.value.phoneNumber),
                onTap: () {},
              ),

              HProfileMenu(
                title: 'Gender',
                value: 'Male',
                onTap: () {},
              ),

              HProfileMenu(
                title: 'Date of Birth',
                value: '01/01/2000',
                onTap: () {},
              ),

              const Divider(),
              const SizedBox(height: HSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Close Account",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
