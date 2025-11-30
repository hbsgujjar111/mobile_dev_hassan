import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  /// Get a `SizedBox` with a specified width.
  SizedBox get w => SizedBox(width: toDouble());

  /// Get a `SizedBox` with a specified height.
  SizedBox get h => SizedBox(height: toDouble());

  /// Get a `SizedBox` with both width and height.
  SizedBox get box => SizedBox(width: toDouble(), height: toDouble());
}
