import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';

class VerticalFlipText extends StatefulWidget {
  final String text;
  final TextStyle? normalStyle;
  final TextStyle? hoverStyle;
  final Duration duration;
  final VoidCallback onTap;

  const VerticalFlipText({
    super.key,
    required this.text,
    this.normalStyle,
    this.hoverStyle,
    required this.onTap,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<VerticalFlipText> createState() => _FlipTextState();
}

class _FlipTextState extends State<VerticalFlipText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _onEnter(bool hovering) {
    if (hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    final normalStyle =
        widget.normalStyle ??
        context.textTheme.bodyMedium!.copyWith(color: isDark ? KColors.textDark : KColors.textLight);
    final hoverStyle =
        widget.hoverStyle ??
        context.textTheme.bodyMedium!.copyWith(color: isDark ? KColors.primaryDark : KColors.primaryLight);

    return MouseRegion(
      onEnter: (_) => _onEnter(true),
      onExit: (_) => _onEnter(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          double value = _animation.value;
          double angle = value * pi;
          bool flipText = value > 0.5;

          return GestureDetector(
            onTap: widget.onTap,
            child: Transform(
              alignment: Alignment.center,
              transform:
                  Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateX(angle),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateX(flipText ? pi : 0),
                child: Text(widget.text, style: flipText ? hoverStyle : normalStyle),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
