import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class HoverIconCard extends StatelessWidget {
  const HoverIconCard({super.key, required this.title, required this.icon, this.onTap, required this.iconColor});

  final String title;
  final IconData icon;
  final Color iconColor;
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
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: 180,
              height: 120,
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
                  color: (isHovered || (context.isTablet || context.isMobile)) ? iconColor : KColors.kTransparent,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(
                    icon,
                    size: KSizes.iconXLg,
                    color:
                        (isHovered || (context.isTablet || context.isMobile))
                            ? iconColor
                            : KColors.neutralSwatch.shade300,
                  ),

                  Text(
                    title,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color:
                          (isHovered || (context.isTablet || context.isMobile))
                              ? iconColor
                              : KColors.neutralSwatch.shade300,
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
