import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/h_circular_image.dart';
import '../shimmer/shimmer.dart';

class HUserProfileTile extends StatelessWidget {
  const HUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : HImages.user;
        return controller.imageUploading.value
            ? const HShimmerEffect(
                width: 50,
                height: 56,
                radius: 56,
              )
            : HCircularImage(
                image: image,
                isNetworkImage: networkImage.isNotEmpty,
                padding: const EdgeInsets.all(0),
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: HColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: HColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: HColors.white),
      ),
    );
  }
}
