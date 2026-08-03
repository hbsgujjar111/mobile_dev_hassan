import 'package:flutter/material.dart';

class KCircularContainer extends StatelessWidget {
  const KCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.child,
    required this.backgroundColor,
    this.margin,
    this.radius = 400,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final Color backgroundColor;
  final double radius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      margin: margin,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
