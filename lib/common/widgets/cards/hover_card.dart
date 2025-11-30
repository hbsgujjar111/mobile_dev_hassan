import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../styles/shadow_styles.dart';

class HoverCard extends StatelessWidget {
  const HoverCard({super.key, required this.child, this.constraints, this.onTap});

  final Widget child;
  final BoxConstraints? constraints;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final hover = ValueNotifier(false);

    return MouseRegion(
      onEnter: (_) => hover.value = true,
      onExit: (_) => hover.value = false,
      cursor: SystemMouseCursors.click,
      child: ValueListenableBuilder(
        valueListenable: hover,
        builder: (context, isHovered, _) {
          return AnimatedScale(
            scale: isHovered ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            child: GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                padding: const EdgeInsets.all(20),
                constraints: constraints,
                decoration: BoxDecoration(
                  color:
                      isDark
                          ? isHovered
                              ? KColors.darkContainer.withValues(alpha: .8)
                              : KColors.darkContainer
                          : isHovered
                          ? KColors.lightContainer.withValues(alpha: .8)
                          : KColors.lightContainer,
                  borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                  border: Border.all(
                    color:
                        isHovered
                            ? isDark
                                ? KColors.primaryDark
                                : KColors.primaryLight
                            : KColors.kTransparent,
                    width: .5,
                  ),
                  boxShadow:
                      isDark
                          ? isHovered
                              ? KShadowStyle.cardShadowDark
                              : KShadowStyle.cardShadowDimDark
                          : isHovered
                          ? KShadowStyle.cardShadow
                          : KShadowStyle.cardShadowDimLight,
                ),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
