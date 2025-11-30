import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static String appVersion = "0.0.0";
  static String appVersionFull = "0.0.0+1";
  static const String myGmail = "mobiledevhassan@gmail.com";
  static const String myNumber = "+92 323 4895585";
  static const String linkedInURL = "https://www.linkedin.com/in/hbsgujjar111";
  static const String stackOverflowURL = "https://stackoverflow.com/users/15538425/hassan-gujjar";
  static const String gitHubURL = "https://github.com/hbsgujjar111";

  /// keys
  static GlobalKey mainSectionKey = GlobalKey();
  static GlobalKey aboutSectionKey = GlobalKey();
  static GlobalKey educationSectionKey = GlobalKey();
  static GlobalKey skillsSectionKey = GlobalKey();
  static GlobalKey experienceSectionKey = GlobalKey();
  static GlobalKey projectSectionKey = GlobalKey();
  static GlobalKey contactSectionKey = GlobalKey();
}
