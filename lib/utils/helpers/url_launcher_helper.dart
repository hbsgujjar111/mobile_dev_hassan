import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

import '../constants/texts.dart';
import 'snackbar_helper.dart';

class UrlLauncherHelper {
  /// function to send email
  static Future<void> launchEmail({
    required String toEmail,
    String subject = "Mobile Dev Needed",
    String body = "Hey! I want to discuss something",
  }) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: encodeQueryParameters({'subject': subject, 'body': body}),
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
      } else {
        throw "No email client found to handle mailto URI";
      }
    } catch (e, s) {
      Logger().f(e.toString(), stackTrace: s);
      SnackbarHelper.errorSnackBar(KTexts.somethingWentWrong);
    }
  }

  /// function to make a phone call
  static Future<void> launchPhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch phone dialer';
      }
    } catch (e) {
      Logger().e(e.toString());
      SnackbarHelper.errorSnackBar(KTexts.somethingWentWrong);
    }
  }

  /// function to open whatsapp chat and message
  static Future<void> launchWhatsApp() async {
    String phoneNumber = "+923234895585";
    String message = "Hi, i need a flutter dev";
    final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}");

    try {
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      Logger().e(e.toString());
      SnackbarHelper.errorSnackBar(KTexts.somethingWentWrong);
    }
  }

  /// function to open link in new tab or on external app
  static Future<void> openLink(String url) async {
    if (url.isNotEmpty) {
      if (kIsWeb) {
        web.window.open(url, '_blank');
      } else {
        final uri = Uri.parse(url);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
