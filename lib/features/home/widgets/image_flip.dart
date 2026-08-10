import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/widgets/images/custom_asset_image.dart';
import '../../../utils/constants/assets_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class ImageFlip extends StatelessWidget {
  final ScrollController scrollController;
  final double combinedHeight;

  const ImageFlip({super.key, required this.scrollController, required this.combinedHeight});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.width;
    final double screenHeight = context.height;
    final double scrollOffset = scrollController.hasClients ? scrollController.offset : 0.0;

    // -------------------------------------------------------------
    // 1️⃣ CURVED, SAFE PROGRESS
    // -------------------------------------------------------------
    final double rawProgress = combinedHeight == 0 ? 0.0 : (scrollOffset / combinedHeight);
    final double progress = rawProgress.clamp(0.0, 1.0);

    final double curved = Curves.easeOut.transform(progress);
    final double horizontalSpeed = 1.4;
    final double safeProgress = (curved * horizontalSpeed).clamp(0.0, 1.0);

    // -------------------------------------------------------------
    // 2️⃣ DYNAMIC RESPONSIVE HORIZONTAL MATH
    // -------------------------------------------------------------
    const double cardWidth = 400.0;

    // Calculates horizontal center-points matching your row content boundaries (80% layout width)
    final double layoutWidth = screenWidth * 0.8;
    final double leftLayoutMargin = (screenWidth - layoutWidth) / 2;

    final double leftColumnCenter = leftLayoutMargin + (layoutWidth * 0.25); // About Section empty column center
    final double rightColumnCenter = leftLayoutMargin + (layoutWidth * 0.75); // Main Section image column center

    // Centering card exactly on respective column axes
    final double startX = rightColumnCenter - (cardWidth / 2);
    final double endX = leftColumnCenter - (cardWidth / 2);

    final double dx = startX - (startX - endX) * safeProgress;

    // -------------------------------------------------------------
    // 3️⃣ VERTICAL MOVEMENT
    // -------------------------------------------------------------
    const double verticalFactor = 0.7;
    final double dy = (scrollOffset * verticalFactor) + (screenHeight / 2) - 180;

    // -------------------------------------------------------------
    // 4️⃣ ROTATION & SINE-WAVE DEPTH SCALE
    // -------------------------------------------------------------
    final double rotationY = safeProgress * pi;
    final bool showFront = safeProgress <= 0.5;

    // Perspective depth: scales down smoothly to 0.88 at the 90° flip midpoint and back to 1.0
    final double scale = 1.0 - (sin(safeProgress * pi) * 0.12);

    // -------------------------------------------------------------
    // 5️⃣ BUILD
    // -------------------------------------------------------------
    return Positioned(
      top: dy,
      left: dx,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..scaleByDouble(scale, scale, scale, 1.0)
          ..rotateY(rotationY),
        child: SizedBox(width: cardWidth, child: showFront ? _front : _back),
      ),
    );
  }

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
