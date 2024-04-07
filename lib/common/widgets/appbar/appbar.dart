import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class HAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.onLeadingTap,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onLeadingTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: HSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                color: HHelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
                ? IconButton(
                    color: HHelperFunctions.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                    icon: Icon(leadingIcon),
                    onPressed: onLeadingTap,
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(HDeviceUtils.getAppBarHeight());
}
