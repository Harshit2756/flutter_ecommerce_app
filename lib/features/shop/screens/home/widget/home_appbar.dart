import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/loaders/shimmer.dart';
import '../../../../../common/widgets/products.cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';

class HHomeAppBar extends StatelessWidget {
  const HHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return HAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: HColors.grey),
          ),
          Obx(() {
            return controller.profileLoading.value
                ? const HShimmerEffect(width: 80, height: 15)
                : Text(
                    controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: HColors.grey),
                  );
          }),
        ],
      ),
      actions: const [HCartCounterIcon(iconColor: HColors.white)],
    );
  }
}
