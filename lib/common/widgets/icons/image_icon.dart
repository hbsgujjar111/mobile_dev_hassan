import 'package:flutter/material.dart';

class KImageIcon extends StatelessWidget {
  const KImageIcon({super.key, required this.icon, this.color, this.size});

  final String icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon, color: color, width: size ?? 24.0, height: size ?? 24.0);
  }
}
