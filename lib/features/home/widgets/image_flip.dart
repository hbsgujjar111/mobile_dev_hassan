import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_dev_hassan/common/widgets/images/custom_asset_image.dart';
import 'package:mobile_dev_hassan/utils/constants/assets_strings.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class ImageFlip extends StatelessWidget {
  final double progress; // 0 → 1 scroll progress
  final double scrollOffset; // raw scroll offset

  const ImageFlip({super.key, required this.progress, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.width;
    final double screenHeight = context.height;

    // -----------------------------
    // 1️⃣ CURVED, SAFE PROGRESS
    // -----------------------------
    final double curved = Curves.easeOut.transform(progress);
    final double horizontalSpeed = 1.4;
    final double safeProgress = (curved * horizontalSpeed).clamp(0.0, 1.0);

    // -----------------------------
    // 2️⃣ HORIZONTAL MOVEMENT
    // -----------------------------
    final double startX = screenWidth * .76; // same as /1.3
    final double endX = screenWidth * .1;

    final double dx = startX - (startX - endX) * safeProgress;

    // -----------------------------
    // 3️⃣ VERTICAL MOVEMENT
    // -----------------------------
    const double verticalFactor = .9;
    final double dy = (scrollOffset * verticalFactor) + (screenHeight / 2) - 180;

    // -----------------------------
    // 4️⃣ ROTATION
    // -----------------------------
    final double rotationY = safeProgress * pi;
    final bool showFront = safeProgress <= .5;

    // -----------------------------
    // 5️⃣ BUILD
    // -----------------------------
    return Positioned(
      top: dy,
      left: dx,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(rotationY),
        child: SizedBox(width: 300, child: showFront ? _front : _back),
      ),
    );
  }

  /// Cached widgets → no rebuild/memory waste
  Widget get _front => ClipRRect(
    borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
    child: const KAssetImage(path: KAssets.main),
  );

  Widget get _back => Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..rotateY(pi),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
      child: const KAssetImage(path: KAssets.about),
    ),
  );
}

/// Cached image widget → avoids rebuild on every scroll frame
