import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class HShadowStyle {
  static final BoxShadow verticalProductShadow = BoxShadow(
    color: HColors.darkGrey.withOpacity(0.1),
    offset: const Offset(0, 2),
    blurRadius: 50,
    spreadRadius: 7,
  );

  static final BoxShadow horizontalProductShadow = BoxShadow(
    color: HColors.darkGrey.withOpacity(0.1),
    offset: const Offset(2, 0),
    blurRadius: 50,
    spreadRadius: 7,
  );
}
