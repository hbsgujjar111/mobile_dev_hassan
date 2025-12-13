import 'package:flutter/material.dart';

class KAssetImage extends StatelessWidget {
  const KAssetImage({super.key, required this.path, this.fit, this.alignment});

  final String path;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit ?? BoxFit.fitWidth,
      alignment: alignment ?? AlignmentGeometry.topCenter,
      cacheWidth: 700,
      filterQuality: FilterQuality.medium,
    );
  }
}
