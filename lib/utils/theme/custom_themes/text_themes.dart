import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KTextTheme {
  KTextTheme._();

  /// Private helpers for consistent styling
  static TextStyle _antonio({
    required Color color,
    required double size,
    FontWeight weight = FontWeight.w600,
    double height = 1.2,
    double letterSpacing = 2.0,
  }) => TextStyle(
    fontFamily: "Antonio",
    color: color,
    fontSize: size,
    fontWeight: weight,
    height: height,
    letterSpacing: letterSpacing,
  );

  static TextStyle _inter({
    required Color color,
    required double size,
    FontWeight weight = FontWeight.w400,
    double height = 1.5,
  }) => TextStyle(fontFamily: "Inter", color: color, fontSize: size, fontWeight: weight, height: height);

  /// Light Theme
  static final lightTextTheme = TextTheme(
    headlineLarge: _antonio(color: KColors.textLight, size: 40, weight: FontWeight.w700),
    headlineMedium: _antonio(color: KColors.textLight, size: 24, weight: FontWeight.w600),
    headlineSmall: _antonio(color: KColors.textLight, size: 20, weight: FontWeight.w500),
    titleLarge: _antonio(color: KColors.textLight, size: 18, weight: FontWeight.w600, letterSpacing: 1.2),
    titleMedium: _antonio(color: KColors.textLight, size: 16, weight: FontWeight.w500, letterSpacing: 1.2),
    titleSmall: _antonio(color: KColors.textLight, size: 14, weight: FontWeight.w400, letterSpacing: 1.2),
    bodyLarge: _inter(color: KColors.textLight, size: 16, weight: FontWeight.w600),
    bodyMedium: _inter(color: KColors.textLight, size: 16, weight: FontWeight.w500),
    bodySmall: _inter(color: KColors.textLight, size: 14, weight: FontWeight.w400),
    labelLarge: _inter(color: KColors.textLight, size: 14),
    labelMedium: _inter(color: KColors.textLight, size: 12, weight: FontWeight.w500),
    labelSmall: _inter(color: KColors.textLight, size: 12, weight: FontWeight.w400),
  );

  /// Dark Theme
  static final darkTextTheme = TextTheme(
    headlineLarge: _antonio(color: KColors.textDark, size: 40, weight: FontWeight.w700),
    headlineMedium: _antonio(color: KColors.textDark, size: 24, weight: FontWeight.w600),
    headlineSmall: _antonio(color: KColors.textDark, size: 20, weight: FontWeight.w500),
    titleLarge: _antonio(color: KColors.textDark, size: 18, weight: FontWeight.w600, letterSpacing: 1.2),
    titleMedium: _antonio(color: KColors.textDark, size: 16, weight: FontWeight.w500, letterSpacing: 1.2),
    titleSmall: _antonio(color: KColors.textDark, size: 14, weight: FontWeight.w400, letterSpacing: 1.2),
    bodyLarge: _inter(color: KColors.textDark, size: 16, weight: FontWeight.w600),
    bodyMedium: _inter(color: KColors.textDark, size: 16, weight: FontWeight.w500),
    bodySmall: _inter(color: KColors.textDark, size: 14, weight: FontWeight.w400),
    labelLarge: _inter(color: KColors.textDark, size: 14),
    labelMedium: _inter(color: KColors.textDark, size: 12, weight: FontWeight.w500),
    labelSmall: _inter(color: KColors.textDark, size: 12, weight: FontWeight.w400),
  );

  static final snackBarTextStyle = TextStyle(
    fontFamily: "Inter",
    color: KColors.kWhite,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
}
