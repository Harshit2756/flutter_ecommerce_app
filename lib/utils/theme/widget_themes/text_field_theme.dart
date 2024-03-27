import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: HColors.darkGrey,
    suffixIconColor: HColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: HSizes.fontSizeMd, color: HColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: HSizes.fontSizeSm, color: HColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: HColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: HColors.darkGrey,
    suffixIconColor: HColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: HSizes.fontSizeMd, color: HColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: HSizes.fontSizeSm, color: HColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: HColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HColors.warning),
    ),
  );
}
