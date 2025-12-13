import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KOutlinedButtonTheme {
  KOutlinedButtonTheme._();

  /// Light Theme
  static OutlinedButtonThemeData lightOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.buttonLight,
      backgroundColor: KColors.kTransparent,
      disabledForegroundColor: KColors.kGrey,
      disabledBackgroundColor: KColors.kGrey,
      side: const BorderSide(color: KColors.buttonLight),
      iconSize: 24.0,
      iconColor: KColors.buttonLight,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.buttonLight,
        fontFamily: "Antonio",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  /// Dark Theme
  static OutlinedButtonThemeData darkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.buttonDark,
      backgroundColor: KColors.kTransparent,
      disabledForegroundColor: KColors.kGrey,
      disabledBackgroundColor: KColors.kGrey,
      side: const BorderSide(color: KColors.buttonDark),
      iconSize: 24.0,
      iconColor: KColors.buttonDark,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.buttonDark,
        fontFamily: "Antonio",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
