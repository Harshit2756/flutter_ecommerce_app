import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_hub/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/h_circular_image.dart';

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
      leading: const HCircularImage(
        image: HImages.user,
        padding: 0,
        width: 50,
        height: 50,
      ),
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
