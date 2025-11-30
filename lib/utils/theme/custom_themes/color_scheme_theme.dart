import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KColorSchemeTheme {
  KColorSchemeTheme._();

  /// Light Theme
  static var lightColorSchemeTheme = ColorScheme.fromSeed(
    seedColor: KColors.primaryLight,
    primary: KColors.primaryLight,
    brightness: Brightness.light,
  );

  /// Dark Theme
  static var darkColorSchemeTheme = ColorScheme.fromSeed(
    seedColor: KColors.primaryDark,
    primary: KColors.primaryDark,
    brightness: Brightness.dark,
  );
}
