import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class HTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? HColors.black : HColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: HColors.primary,
        unselectedLabelColor: HColors.darkGrey,
        labelColor: isDark ? HColors.white : HColors.black,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(HDeviceUtils.getAppBarHeight());
}
