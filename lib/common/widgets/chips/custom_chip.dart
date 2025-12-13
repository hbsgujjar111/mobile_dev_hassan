import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class KChip extends StatelessWidget {
  const KChip({super.key, required this.clipItems});

  final List<String> clipItems;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Wrap(
      spacing: KSizes.spaceBtwItems / 4,
      runSpacing: KSizes.spaceBtwItems / 4,
      children: List.generate(clipItems.length, (index) {
        final color = isDark
            ? KColors.darkChipColors[index % KColors.darkChipColors.length]
            : KColors.lightChipColors[index % KColors.lightChipColors.length];
        return _AnimatedChip(label: clipItems[index], color: color);
      }),
    );
  }
}

class _AnimatedChip extends StatefulWidget {
  const _AnimatedChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  State<_AnimatedChip> createState() => _AnimatedChipState();
}

class _AnimatedChipState extends State<_AnimatedChip> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // ignore: unused_field
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _onEnter(bool hover) {
    setState(() => _hovered = hover);
    if (hover) {
      _controller.forward(from: 0);
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEnter(true),
      onExit: (_) => _onEnter(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isDark = context.isDarkMode;

          final textColor = ColorTween(
            begin: widget.color,
            end: isDark ? KColors.blackColor : KColors.kWhite,
          ).evaluate(_animation);

          final borderRadius = 50.0;

          return FittedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: widget.color),
                color: KColors.kTransparent,
              ),
              child: Stack(
                children: [
                  // Sliding fill layer with clipping
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _animation.value,
                        child: Container(color: widget.color),
                      ),
                    ),
                  ),
                  // Label on top
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Center(
                      child: Text(
                        widget.label,
                        style: context.textTheme.labelMedium!.copyWith(color: textColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
