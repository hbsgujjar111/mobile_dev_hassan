import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile_dev_hassan/features/project/widgets/package_card.dart';
import 'package:mobile_dev_hassan/utils/constants/colors.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../../utils/extensions/context_extensions.dart';
import 'notifiers/package_notifier.dart';
import 'notifiers/project_notifier.dart';
import 'widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Center(
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
                      /// Section Header Title
                      Text(KTexts.project.toUpperCase(), style: context.textTheme.headlineLarge),

                      /// Responsive TabBar Header
                      SizedBox(
                        width: screenWidth > 600 ? 400 : double.infinity,
                        child: TabBar(
                          indicatorColor: context.isDarkMode ? KColors.primaryDark : KColors.primaryLight,
                          labelColor: context.isDarkMode ? KColors.primaryDark : KColors.primaryLight,
                          unselectedLabelColor: context.textTheme.bodyMedium?.color?.withValues(alpha: .6),
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Tab(text: KTexts.mobileApps, icon: Icon(Icons.phone_iphone_rounded)),
                            Tab(text: KTexts.packages, icon: Icon(Icons.inventory_2_rounded)),
                          ],
                        ),
                      ),

                      /// Dynamic Tab View Handler
                      Builder(
                        builder: (context) {
                          // Fetch the TabController created by DefaultTabController
                          final tabController = DefaultTabController.of(context);

                          return ListenableBuilder(
                            listenable: DefaultTabController.of(context),
                            builder: (context, _) => tabController.index == 0
                                ? MasonryGridView.count(
                                    crossAxisCount: crossAxisCount,
                                    mainAxisSpacing: KSizes.gridViewSpacing,
                                    crossAxisSpacing: KSizes.gridViewSpacing,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: projects.length,
                                    itemBuilder: (_, i) => ProjectCard(data: projects[i]),
                                  )
                                : MasonryGridView.count(
                                    crossAxisCount: crossAxisCount,
                                    mainAxisSpacing: KSizes.gridViewSpacing,
                                    crossAxisSpacing: KSizes.gridViewSpacing,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: packagesList.length,
                                    itemBuilder: (_, i) => PackageCard(package: packagesList[i]),
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
