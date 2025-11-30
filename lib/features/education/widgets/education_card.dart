import 'package:flutter/material.dart';

import '../../../common/widgets/cards/hover_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../model/education_model.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key, required this.data});

  final EducationModel data;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: KSizes.spaceBtwItems / 4,
        children: [
          Text(
            data.degree ?? "---",
            style: context.textTheme.headlineSmall!.copyWith(
              color: context.isDarkMode ? KColors.primaryDark : KColors.primaryLight,
            ),
          ),
          Text(data.school ?? "---", style: context.textTheme.titleLarge),
          Row(
            spacing: KSizes.spaceBtwItems / 8,
            children: [
              Text(
                "${data.startTime?.year} - ${data.endTime?.year}",
                style: context.textTheme.labelMedium!.copyWith(color: KColors.neutralSwatch.shade300),
              ),
              Text("|", style: context.textTheme.labelMedium!.copyWith(color: KColors.neutralSwatch.shade300)),
              Text(
                data.location ?? "---",
                style: context.textTheme.labelMedium!.copyWith(color: KColors.neutralSwatch.shade300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
