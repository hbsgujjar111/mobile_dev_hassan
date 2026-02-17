import 'dart:js_interop';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle, Clipboard, ClipboardData;
import 'package:web/web.dart' as web;

import '../../common/styles/shadow_styles.dart';
import '../constants/assets_strings.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/texts.dart';
import '../extensions/context_extensions.dart';

class KHelperFunctions {
  /// greeting function
  static String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return KTexts.goodMorning;
    } else if (hour >= 12 && hour < 17) {
      return KTexts.goodAfternoon;
    } else if (hour >= 17 && hour < 21) {
      return KTexts.goodEvening;
    } else {
      return KTexts.goodEvening;
    }
  }

  /// copy to clipboard function
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

  /// scroll to specific section function
  static void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!, duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

  /// download file section

  static Future<void> downloadFile() async {
    // Load bytes from asset
    final data = await rootBundle.load(KAssets.resume);
    final Uint8List bytes = data.buffer.asUint8List();

    // Convert Dart list → JSArray<BlobPart>
    final blobParts = <JSAny>[bytes.toJS].toJS;

    // Create Blob using JS blob parts
    final blob = web.Blob(blobParts);

    // Blob URL
    final url = web.URL.createObjectURL(blob);

    // Create anchor element
    final anchor = web.HTMLAnchorElement()
      ..href = url
      ..download = "Hassan_Flutter_Dev_Resume.pdf"
      ..style.display = "none";

    // Trigger download
    web.document.body!.append(anchor);
    anchor.click();

    // Cleanup
    anchor.remove();
    web.URL.revokeObjectURL(url);
  }

  /// get dynamic experience text
  static String getExperienceText() {
    var start = DateTime(2021, 2, 1);

    final now = DateTime.now();

    // 1. Calculate the initial difference in years and months
    int years = now.year - start.year;
    int months = now.month - start.month;

    // 2. Adjust if the current day hasn't reached the start day yet
    if (now.day < start.day) {
      months--;
    }

    // 3. Normalize months (handle negative results from step 1)
    if (months < 0) {
      years--;
      months += 12;
    }

    // 4. Return dynamic phrasing based on the month count
    if (years == 0) {
      if (months == 0) return "Just started";
      return "$months months of experience";
    }

    // Logic for years
    if (months <= 2) {
      return "$years+";
    } else if (months >= 3 && months <= 8) {
      return "$years.5";
    } else if (months >= 9) {
      return "Almost ${years + 1}";
    } else {
      return "$years";
    }
  }
}
