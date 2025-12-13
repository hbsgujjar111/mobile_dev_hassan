import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../../utils/extensions/context_extensions.dart';
import 'notifiers/project_notifier.dart';
import 'widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: (context.isMobile || context.isTablet) ? context.width * .9 : context.width * .8,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            const maxCardWidth = 400.0;
            final crossAxisCount = (screenWidth / maxCardWidth).floor().clamp(1, 3);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
              child: SingleChildScrollView(
                child: Column(
                  spacing: KSizes.spaceBtwSections,
                  children: [
                    Text(KTexts.project.toUpperCase(), style: context.textTheme.headlineLarge),

                    MasonryGridView.count(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: KSizes.gridViewSpacing,
                      crossAxisSpacing: KSizes.gridViewSpacing,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: projects.length,
                      itemBuilder: (_, i) => ProjectCard(data: projects[i]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
