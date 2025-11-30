import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class KCircularImage extends StatelessWidget {
  const KCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding,
    this.overlayColor,
    this.backgroundColor,
    this.isNetworkImage = false,
    this.fit,
    required this.image,
    this.borderRadius,
    this.border,
    this.boxShadow,
  });

  final double width, height;
  final double? padding;
  final Color? overlayColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;
  final double? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? KSizes.sm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 100),
        border: border,
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 100),
        child: Image(
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
          fit: fit,
        ),
      ),
    );
  }
}
