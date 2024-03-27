import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.light,
      backgroundColor: HColors.primary,
      disabledForegroundColor: HColors.darkGrey,
      disabledBackgroundColor: HColors.buttonDisabled,
      side: const BorderSide(color: HColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: HColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: HColors.light,
      backgroundColor: HColors.primary,
      disabledForegroundColor: HColors.darkGrey,
      disabledBackgroundColor: HColors.darkerGrey,
      side: const BorderSide(color: HColors.primary),
      padding: const EdgeInsets.symmetric(vertical: HSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: HColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HSizes.buttonRadius)),
    ),
  );
}
