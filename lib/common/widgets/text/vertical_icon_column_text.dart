import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../icons/image_icon.dart';

class VerticalIconColumnText extends StatelessWidget {
  const VerticalIconColumnText({
    super.key,
    required this.subTitle,
    this.title,
    this.icon,
    this.imageIcon,
    this.iconSize,
    this.titleSize,
    this.subTitleSize,
    this.iconColor,
    this.iconBgColor,
  });

  final String? title;
  final String subTitle;
  final IconData? icon;
  final String? imageIcon;
  final double? iconSize;
  final double? titleSize;
  final double? subTitleSize;
  final Color? iconColor;
  final Color? iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Icon
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(shape: BoxShape.circle, color: iconBgColor ?? KColors.kWhite),
          child: Center(
            child:
                icon != null
                    ? Skeleton.shade(
                      child: Icon(icon!, size: iconSize ?? 24, color: iconColor ?? KColors.neutralSwatch.shade900),
                    )
                    : Skeleton.shade(child: KImageIcon(icon: imageIcon ?? "", size: iconSize ?? 24, color: iconColor)),
          ),
        ),

        KSizes.spaceBtwItems.h,

        if (title != null && title!.isNotEmpty) Text(title!, style: context.textTheme.bodyMedium),
        Text(subTitle, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
