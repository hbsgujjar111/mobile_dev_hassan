import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class HoverIcon extends StatelessWidget {
  const HoverIcon({
    super.key,
    required this.icon,
    this.onTap,
    required this.iconColor,
    this.isImage = false,
    this.assetPath,
    this.tooltipText,
  });

  final IconData? icon;
  final Color iconColor;
  final void Function()? onTap;
  final bool isImage;
  final String? assetPath;
  final String? tooltipText;

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
          final tooltip =
              tooltipText != null
                  ? Tooltip(message: tooltipText!, child: _buildIconOrImage(isHovered, context))
                  : _buildIconOrImage(isHovered, context);

          return GestureDetector(onTap: onTap, child: tooltip);
        },
      ),
    );
  }

  // Determines whether to display an icon or an image
  Widget _buildIconOrImage(bool isHovered, BuildContext context) {
    if (isImage) {
      return Image.asset(
        assetPath!,
        width: KSizes.iconLg,
        height: KSizes.iconLg,
        colorBlendMode: (context.isTablet || context.isMobile) ? null : BlendMode.modulate,
        color: (isHovered || (context.isTablet || context.isMobile)) ? null : KColors.neutralSwatch.shade300,
      );
    } else {
      return FaIcon(
        icon,
        size: KSizes.iconLg,
        color: (isHovered || (context.isTablet || context.isMobile)) ? iconColor : KColors.neutralSwatch.shade300,
      );
    }
  }
}
