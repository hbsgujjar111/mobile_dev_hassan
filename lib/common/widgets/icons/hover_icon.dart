import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class HoverIcon extends StatelessWidget {
  const HoverIcon({
    super.key,
    required this.icon,
    this.onTap,
    required this.iconColor,
    this.tooltipText,
    this.isMulticolor = false,
  }) : assetPath = null,
       svgIcon = null;

  const HoverIcon.svg({
    super.key,
    required this.svgIcon,
    this.onTap,
    required this.iconColor,
    this.tooltipText,
    this.isMulticolor = false,
  }) : icon = null,
       assetPath = null;

  const HoverIcon.image({
    super.key,
    required this.assetPath,
    this.onTap,
    required this.iconColor,
    this.tooltipText,
    this.isMulticolor = false,
  }) : icon = null,
       svgIcon = null;

  final IconData? icon;
  final Color iconColor;
  final void Function()? onTap;
  final String? assetPath;
  final String? svgIcon;
  final String? tooltipText;
  final bool isMulticolor;

  @override
  Widget build(BuildContext context) {
    final hover = ValueNotifier(false);

    return MouseRegion(
      onEnter: (_) => hover.value = true,
      onExit: (_) => hover.value = false,
      cursor: SystemMouseCursors.click,
      child: ValueListenableBuilder(
        valueListenable: hover,
        builder: (context, isHovered, _) {
          final tooltip = tooltipText != null
              ? Tooltip(message: tooltipText!, child: _buildIconOrImage(isHovered, context))
              : _buildIconOrImage(isHovered, context);

          return GestureDetector(onTap: onTap, child: tooltip);
        },
      ),
    );
  }

  Widget _buildIconOrImage(bool isHovered, BuildContext context) {
    final bool showActiveState = isHovered || context.isTablet || context.isMobile;

    /// IMAGE ASSET HANDLING (Multi-colored by default)
    if (assetPath != null) {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 200), // Smooth fade transition
        opacity: showActiveState ? 1.0 : 0.3, // Dim/dull on unhover, bright on hover
        child: Image.asset(assetPath!, width: KSizes.iconLg, height: KSizes.iconLg),
      );
    }
    /// SVG ASSET HANDLING
    else if (svgIcon != null) {
      if (isMulticolor) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200), // Smooth fade transition
          opacity: showActiveState ? 1.0 : 0.4, // Dim/dull on unhover, bright on hover
          child: SvgPicture.asset(svgIcon!, width: KSizes.iconLg, height: KSizes.iconLg),
        );
      } else {
        // Monochrome SVG (like Apple App Store) - Tints and smoothly fades
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: showActiveState ? 1.0 : 0.6, // Soft dim on unhover
          child: SvgPicture.asset(
            svgIcon!,
            width: KSizes.iconLg,
            height: KSizes.iconLg,
            colorFilter: ColorFilter.mode(
              showActiveState ? iconColor : KColors.neutralSwatch.shade300,
              BlendMode.srcIn,
            ),
          ),
        );
      }
    }
    /// MATERIAL ICON HANDLING (Always monochrome)
    else {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: showActiveState ? 1.0 : 0.6,
        child: Icon(icon, size: KSizes.iconLg, color: showActiveState ? iconColor : KColors.neutralSwatch.shade300),
      );
    }
  }
}
