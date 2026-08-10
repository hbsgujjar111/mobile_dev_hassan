import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class HoverIconCard extends StatelessWidget {
  const HoverIconCard({super.key, required this.title, required this.icon, required this.iconColor, this.onTap})
    : svgIcon = null;

  const HoverIconCard.svg({super.key, required this.title, required this.svgIcon, required this.iconColor, this.onTap})
    : icon = null;

  final String title;
  final IconData? icon;
  final String? svgIcon;
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
      child: ValueListenableBuilder<bool>(
        valueListenable: hover,
        builder: (context, isHovered, _) {
          final isActive = isHovered || context.isTablet || context.isMobile;

          final iconColor = isActive
              ? this.iconColor
              : isDark
              ? KColors.textDark
              : KColors.textLight;

          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: 140,
              height: 100,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark
                    ? isHovered
                          ? KColors.darkContainer.withValues(alpha: .8)
                          : KColors.darkContainer
                    : isHovered
                    ? KColors.lightContainer.withValues(alpha: .8)
                    : KColors.lightContainer,
                borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                border: Border.all(color: isActive ? this.iconColor : KColors.kTransparent),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (svgIcon != null) ...[
                    SvgPicture.asset(
                      svgIcon!,
                      width: KSizes.iconLg,
                      height: KSizes.iconLg,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ] else ...[
                    Icon(icon!, size: KSizes.iconLg, color: iconColor),
                  ],

                  Text(title, style: context.textTheme.bodySmall!.copyWith(color: iconColor)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
