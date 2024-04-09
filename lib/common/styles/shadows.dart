import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class HShadowStyle {
  static final BoxShadow verticalProductShadow = BoxShadow(
    color: HColors.darkGrey.withOpacity(0.1),
    offset: const Offset(0, 1.5),
    blurRadius: 10,
    spreadRadius: 2,
  );
}
