import 'package:flutter/material.dart';

import '../../common/widgets/layouts/listview_layout.dart';
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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height,
          maxWidth: (context.isMobile || context.isTablet) ? context.width * .9 : context.width * .8,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
          child: SingleChildScrollView(
            child: Column(
              spacing: KSizes.spaceBtwSections,
              children: [
                Text(KTexts.project.toUpperCase(), style: context.textTheme.headlineLarge),

                KSeparatedListView(itemCount: projects.length, itemBuilder: (_, i) => ProjectCard(data: projects[i])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
