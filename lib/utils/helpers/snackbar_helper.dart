import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../common/styles/shadow_styles.dart';
import '../constants/colors.dart';
import '../theme/custom_themes/text_themes.dart';

class SnackbarHelper {
  static void successSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(Icons.check_circle_rounded, color: KColors.kWhite),
      showIcon: true,
      backgroundColor: KColors.success,
      foregroundColor: KColors.kWhite,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.kWhite),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static void errorSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(Icons.close_rounded, color: KColors.kWhite),
      showIcon: true,
      backgroundColor: KColors.error,
      foregroundColor: KColors.kWhite,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.kWhite),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static void warningSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle.copyWith(color: KColors.blackColor)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(Icons.warning_amber_rounded, color: KColors.blackColor),
      showIcon: true,
      backgroundColor: KColors.warning,
      foregroundColor: KColors.blackColor,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.blackColor),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static void infoSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(Icons.error_outline_rounded, color: KColors.kWhite),
      showIcon: true,
      backgroundColor: KColors.info,
      foregroundColor: KColors.kWhite,
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.kWhite),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }
}
