import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/color_scheme_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/floating_action_button_theme.dart';
import 'custom_themes/icon_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_themes.dart';

class KAppTheme {
  KAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: KColorSchemeTheme.lightColorSchemeTheme,
    primarySwatch: KColors.primaryLightSwatch,
    primaryColor: KColors.primaryLight,
    scaffoldBackgroundColor: KColors.light,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonThemeData,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonThemeData,
    iconButtonTheme: KIconButtonTheme.lightIconButtonThemeData,
    floatingActionButtonTheme: KFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    textTheme: KTextTheme.lightTextTheme,
  );

  /// dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: KColorSchemeTheme.darkColorSchemeTheme,
    primarySwatch: KColors.primaryDarkSwatch,
    primaryColor: KColors.primaryDark,
    scaffoldBackgroundColor: KColors.dark,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonThemeData,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonThemeData,
    iconButtonTheme: KIconButtonTheme.darkIconButtonThemeData,
    floatingActionButtonTheme: KFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    textTheme: KTextTheme.darkTextTheme,
  );
}
