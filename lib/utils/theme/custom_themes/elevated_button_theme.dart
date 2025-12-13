import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  /// Light Theme
  static ElevatedButtonThemeData lightElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.kWhite,
      backgroundColor: KColors.buttonLight,
      disabledForegroundColor: KColors.kWhite,
      disabledBackgroundColor: KColors.neutral,
      iconSize: 24.0,
      iconColor: KColors.kWhite,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.kWhite,
        fontFamily: "Antonio",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  /// dark theme
  static ElevatedButtonThemeData darkElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.kBlack,
      backgroundColor: KColors.buttonDark,
      disabledForegroundColor: KColors.blackColor,
      disabledBackgroundColor: KColors.neutral,
      iconSize: 24.0,
      iconColor: KColors.blackColor,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.blackColor,
        fontFamily: "Antonio",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
