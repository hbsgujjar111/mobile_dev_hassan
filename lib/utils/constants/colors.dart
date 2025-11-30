import 'package:flutter/material.dart';

class KColors {
  KColors._();

  /// App Basic Colors
  static const Color primaryLight = Color(0xFF1e6ef4);
  static const Color primaryDark = Color(0xFF7aff70);
  static const Color primary = Color(0xFFC73907);
  static const Color secondary = Color(0xFFFF6A10);
  static const Color neutral = Color(0xFF6E6D6C);

  /// Gradient Colors
  static const Gradient linearGradientLight = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    colors: [Color(0xFF0A3EC9), Color(0xFF165AE2)],
  );

  static const Gradient linearGradientDark = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    colors: [Color(0xFF3A8A45), Color(0xFF62D05E)],
  );

  /// chip colors
  static final List<Color> darkChipColors = [
    Color(0xFFD7CCC8), // Light Brown
    Color(0xFFCFD8DC), // Light Blue Grey
    Color(0xFF90CAF9), // Light Blue
    Color(0xFF80CBC4), // Light Teal
    Color(0xFFE1BEE7), // Light Purple
    Color(0xFFFFCCBC), // Light Orange
    Color(0xFFA5D6A7), // Light Green
  ];

  static final List<Color> lightChipColors = [
    Color(0xFF5D4037), // Dark Brown
    Color(0xFF455A64), // Blue Grey
    Color(0xFF1E88E5), // Strong Blue
    Color(0xFF00897B), // Teal Green
    Color(0xFF6A1B9A), // Deep Purple
    Color(0xFFD84315), // Deep Orange
    Color(0xFF2E7D32), // Dark Green
  ];

  /// Brand Colors
  static const Color linkedIn = Color(0xFF0A66C2);
  static const Color stackOverflow = Color(0xFFf48024);
  static const Color gitHub = Color(0xFF171515);
  static const Color android = Color(0xFF3DDC84);
  static const Color appStore = Color(0xFF0D96F6);
  static const Color huawei = Color(0xFFF0A500);
  static const Color windows = Color(0xFF00A4EF);
  static const Color web = Color(0xFF2196F3);

  /// Text Colors
  static const Color textLight = Color(0xFF000000);
  static const Color textLightSecondary = Color(0x00000080);
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color textDarkSecondary = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2F2F2E);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Color(0xffFFFFFF);

  /// Background Colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF1A1A1B);

  /// Background Container Colors
  static const Color lightContainer = Color(0xFFf0f0f0);
  static const Color lightContainerSecondary = Color(0xFFf8f9fa);
  static Color darkContainer = Color(0xFF333333);
  static Color darkContainerSecondary = Color(0xFF0F0F0F);

  /// Button Colors
  static const Color buttonLight = Color(0xFF1e6ef4);
  static const Color buttonDark = Color(0xFF7aff70);
  static const Color buttonPrimary = Color(0xFFFF6A10);
  static const Color buttonSecondary = Color(0xFF387AF2);
  static const Color buttonDisabled = Color(0xFFFFB570);
  static const Color supportButtonColor = Color(0xFF25D366);

  /// Border Colors
  static const Color borderPrimary = Color(0xFFFF6A10);
  static const Color borderSecondary = Color(0xFF387AF2);

  /// Error and Validation Colors
  static const Color success = Color(0xFF31B656);
  static const Color error = Color(0xFFEC4942);
  static const Color warning = Color(0xFFF6BC2F);
  static const Color info = Color(0xFF387AF2);

  /// Neutral Shades
  static const Color kBlack = Color(0xFF232323);
  static const Color darkestGrey = Color(0xff4F4F4F);
  static const Color darkGrey = Color(0xff808080);
  static const Color kGrey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color kTransparent = Colors.transparent;

  /// swatches

  static const MaterialColor primaryLightSwatch = MaterialColor(0xFF1E6EF4, <int, Color>{
    50: Color(0xFFE3EEFD),
    100: Color(0xFFB9D3FB),
    200: Color(0xFF8CB7F9),
    300: Color(0xFF5F9AF7),
    400: Color(0xFF3D84F5),
    500: Color(0xFF1E6EF4),
    600: Color(0xFF1A65EC),
    700: Color(0xFF165AE2),
    800: Color(0xFF1250D9),
    900: Color(0xFF0A3EC9),
  });

  static const MaterialColor primaryDarkSwatch = MaterialColor(0xFF7AFF70, <int, Color>{
    50: Color(0xFFF0FFE9),
    100: Color(0xFFDAFFCA),
    200: Color(0xFFC0FFA8),
    300: Color(0xFFA6FF86),
    400: Color(0xFF93FF6D),
    500: Color(0xFF7AFF70),
    600: Color(0xFF6FEA68),
    700: Color(0xFF62D05E),
    800: Color(0xFF54B555),
    900: Color(0xFF3A8A45),
  });

  static const MaterialColor primarySwatch = MaterialColor(0xFFFF6A10, <int, Color>{
    50: Color(0xFFFFECD4),
    100: Color(0xFFFFD4A8),
    200: Color(0xFFFFB570),
    300: Color(0xFFFF8A37),
    400: Color(0xFFFF6A10),
    500: Color(0xFFF04E06),
    600: Color(0xFFC73907),
    700: Color(0xFF9E2D0E),
    800: Color(0xFF7F280F),
    900: Color(0xFF451105),
  });

  static const MaterialColor secondarySwatch = MaterialColor(0xFF387AF2, <int, Color>{
    50: Color(0xFFDCE9FD),
    100: Color(0xFFC0D9FD),
    200: Color(0xFF95C2FB),
    300: Color(0xFF63A1F7),
    400: Color(0xFF387AF2),
    500: Color(0xFF295FE7),
    600: Color(0xFF214CD4),
    700: Color(0xFF213EAC),
    800: Color(0xFF203888),
    900: Color(0xFF182553),
  });

  static const MaterialColor neutralSwatch = MaterialColor(0xFF6E6D6C, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFF2F2F2),
    200: Color(0xFFB1B0AF),
    300: Color(0xFF898887),
    400: Color(0xFF6E6D6C),
    500: Color(0xFF5E5D5C),
    600: Color(0xFF504F4E),
    700: Color(0xFF464644),
    800: Color(0xFF3D3D3C),
    900: Color(0xFF2F2F2E),
  });

  static const MaterialColor errorSwatch = MaterialColor(0xFFFF6A10, <int, Color>{
    50: Color(0xFFFDCDCB),
    100: Color(0xFFFBAAA6),
    200: Color(0xFFF67873),
    300: Color(0xFFEC4942),
  });

  static const MaterialColor successSwatch = MaterialColor(0xFFFF6A10, <int, Color>{
    50: Color(0xFFDAF2E1),
    100: Color(0xFF90E5A7),
    200: Color(0xFF58D079),
    300: Color(0xFF31B656),
  });
}
