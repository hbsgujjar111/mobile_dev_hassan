import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class KShadowStyle {
  static final snackbarShadow = BoxShadow(
    color: KColors.neutralSwatch.shade800,
    blurRadius: 48,
    offset: Offset(0, 16),
    spreadRadius: 0,
  );

  static final cardShadowDimLight = [
    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4)),
    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 4, spreadRadius: -1, offset: Offset(0, 2)),
  ];

  static final cardShadowDimDark = [
    BoxShadow(
      color: KColors.primaryDark.withValues(alpha: 0.1),
      blurRadius: 6,
      spreadRadius: -1,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: KColors.primaryDark.withValues(alpha: 0.06),
      blurRadius: 4,
      spreadRadius: -1,
      offset: const Offset(0, 2),
    ),
  ];

  static final cardShadow = [
    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 15, spreadRadius: -3, offset: Offset(0, 10)),
    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 6, spreadRadius: -2, offset: Offset(0, 4)),
  ];

  static final cardShadowDark = [
    BoxShadow(
      color: KColors.primaryDark.withValues(alpha: 0.1),
      blurRadius: 15,
      spreadRadius: -3,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: KColors.primaryDark.withValues(alpha: 0.05),
      blurRadius: 6,
      spreadRadius: -2,
      offset: const Offset(0, 4),
    ),
  ];
}
