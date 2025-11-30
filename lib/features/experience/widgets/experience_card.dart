import 'package:flutter/material.dart';

import '../../../common/widgets/cards/hover_card.dart';
import '../../../common/widgets/layouts/listview_layout.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/date_time_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../model/experience_model.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.isSmallScreen, required this.data});

  final bool isSmallScreen;
  final ExperienceModel data;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      constraints: BoxConstraints(maxWidth: isSmallScreen ? context.width * .74 : context.width),
      child: Column(
        spacing: KSizes.spaceBtwItems / 2,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.designation ?? "---",
            style: context.textTheme.headlineSmall!.copyWith(
              color: context.isDarkMode ? KColors.primaryDark : KColors.primaryLight,
            ),
          ),

          Flexible(
            child: Text(
              data.company ?? "---",
              overflow: TextOverflow.ellipsis,
              maxLines: 8,
              style: context.textTheme.titleLarge,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data.startTime?.formatDate() ?? "---"} - ${data.endTime?.formatDate() ?? KTexts.present}',
                style: context.textTheme.labelMedium!.copyWith(color: KColors.neutralSwatch.shade300),
              ),
              Text(
                data.location ?? "---",
                style: context.textTheme.labelMedium!.copyWith(color: KColors.neutralSwatch.shade300),
              ),
            ],
          ),
          KSeparatedListView(
            itemCount: data.responsibilities!.length,
            separatorBuilder: (_, _) => 2.h,
            itemBuilder: (_, i) => Text("• ${data.responsibilities![i]}", style: context.textTheme.labelMedium),
          ),
        ],
      ),
    );
  }
}
