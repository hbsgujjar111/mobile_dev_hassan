import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class KFloatingActionButtonTheme {
  KFloatingActionButtonTheme._();

  /// Light Theme
  static FloatingActionButtonThemeData lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: KColors.kWhite,
    backgroundColor: KColors.buttonLight,
    iconSize: KSizes.iconMd,
    extendedIconLabelSpacing: KSizes.spaceBtwItems / 2,
    sizeConstraints: BoxConstraints(minHeight: 48),
    extendedTextStyle: TextStyle(
      color: KColors.kWhite,
      fontFamily: "Antonio",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  /// Dark Theme
  static FloatingActionButtonThemeData darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: KColors.kBlack,
    backgroundColor: KColors.buttonDark,
    iconSize: KSizes.iconMd,
    extendedIconLabelSpacing: KSizes.spaceBtwItems / 2,
    sizeConstraints: BoxConstraints(minHeight: 48),
    extendedTextStyle: TextStyle(
      color: KColors.blackColor,
      fontFamily: "Antonio",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
