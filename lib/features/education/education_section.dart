import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../../utils/extensions/context_extensions.dart';
import 'notifiers/education_notifier.dart';
import 'widgets/education_card.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: (context.isTablet || context.isMobile) ? context.width * .9 : context.width * .8,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            const maxCardWidth = 350.0;
            final crossAxisCount = (screenWidth / maxCardWidth).floor().clamp(1, 3);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: KSizes.spaceBtwSections,
                children: [
                  Text(KTexts.education.toUpperCase(), style: context.textTheme.headlineLarge),

                  MasonryGridView.count(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: KSizes.gridViewSpacing,
                    crossAxisSpacing: KSizes.gridViewSpacing,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: educations.length,
                    itemBuilder: (_, i) => EducationCard(data: educations[i]),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
