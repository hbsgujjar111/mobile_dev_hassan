import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/styles/shadow_styles.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/texts.dart';
import '../extensions/context_extensions.dart';

class KHelperFunctions {
  static String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return KTexts.goodMorning;
    } else if (hour >= 12 && hour < 17) {
      return KTexts.goodAfternoon;
    } else if (hour >= 17 && hour < 21) {
      return KTexts.goodEvening;
    } else {
      return KTexts.goodNight;
    }
  }

  static void copyToClipboard({required BuildContext context, required String text}) {
    final isDark = context.isDarkMode;

    if (text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: text));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: KColors.kTransparent,
          elevation: 0.0,
          content: Center(
            child: Container(
              constraints: BoxConstraints(minWidth: 160),
              decoration: BoxDecoration(
                color: isDark ? KColors.darkContainer : KColors.lightContainer,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [KShadowStyle.snackbarShadow],
              ),
              padding: EdgeInsets.symmetric(vertical: KSizes.sm, horizontal: KSizes.md),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: KSizes.spaceBtwItems / 4,
                children: [
                  Icon(Icons.check_circle_rounded, color: KColors.success),
                  Text(KTexts.copiedClipboard, style: context.textTheme.labelLarge),
                ],
              ),
            ),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  static void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
  }
}
