import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/h_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
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
                    const HCircularImage(
                      image: HImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
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
                value: 'John Doe',
                onTap: () {},
              ),

              HProfileMenu(
                title: 'Username',
                value: 'johndoe',
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
                value: '456789',
                icon: Iconsax.copy,
                onTap: () {},
              ),

              HProfileMenu(
                title: 'Email',
                value: 'Khandelwalharshit431@gmail.com',
                onTap: () {},
              ),

              HProfileMenu(
                title: 'Phone',
                value: '+91 1234567890',
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
                  onPressed: () {},
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
