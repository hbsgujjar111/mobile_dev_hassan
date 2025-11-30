import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KIconButtonTheme {
  KIconButtonTheme._();

  /// Light Theme
  static IconButtonThemeData lightIconButtonThemeData = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.kWhite,
      backgroundColor: KColors.primaryLight,
      disabledForegroundColor: KColors.kWhite,
      disabledBackgroundColor: KColors.neutral,
      iconSize: 24.0,
      fixedSize: Size.fromHeight(40),
      shape: CircleBorder(),
    ),
  );

  /// dark theme
  static IconButtonThemeData darkIconButtonThemeData = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.kBlack,
      backgroundColor: KColors.primaryDark,
      disabledForegroundColor: KColors.blackColor,
      disabledBackgroundColor: KColors.neutral,
      iconSize: 24.0,
      fixedSize: Size.fromHeight(40),
      shape: CircleBorder(),
    ),
  );
}
