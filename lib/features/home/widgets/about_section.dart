import 'package:flutter/material.dart';

import '../../../common/widgets/cards/hover_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height,
          maxWidth: (context.isMobile || context.isTablet) ? context.width * .9 : context.width * .8,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
          child: Row(
            spacing: KSizes.spaceBtwItems,
            children: [
              if (!context.isMobile && !context.isTablet) Expanded(child: SizedBox()),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: KSizes.spaceBtwSections,
                  children: [
                    Text(KTexts.aboutMe.toUpperCase(), style: context.textTheme.headlineLarge),
                    Text(KTexts.aboutMeContent, style: context.textTheme.bodyMedium),

                    HoverCard(
                      constraints: BoxConstraints(minWidth: context.width * .24, maxWidth: context.width * .9),
                      child: Wrap(
                        spacing: KSizes.spaceBtwItems,
                        runSpacing: KSizes.spaceBtwItems,
                        children: [
                          Column(
                            spacing: KSizes.spaceBtwItems / 2,
                            children: [
                              Text(
                                KTexts.experienceCount,
                                style: context.textTheme.headlineLarge!.copyWith(
                                  color: isDark ? KColors.primaryDark : KColors.primaryLight,
                                  fontSize:
                                      context.isTablet
                                          ? 44
                                          : context.isMobile
                                          ? 38
                                          : 50,
                                ),
                              ),
                              Text(
                                KTexts.yearsOfExperience,
                                style: context.textTheme.headlineSmall!.copyWith(
                                  fontSize:
                                      context.isTablet
                                          ? 16
                                          : context.isMobile
                                          ? 18
                                          : 20,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: KSizes.spaceBtwItems / 2,
                            children: [
                              Text(
                                KTexts.projectCount,
                                style: context.textTheme.headlineLarge!.copyWith(
                                  color: isDark ? KColors.primaryDark : KColors.primaryLight,
                                  fontSize:
                                      context.isTablet
                                          ? 44
                                          : context.isMobile
                                          ? 38
                                          : 50,
                                ),
                              ),
                              Text(
                                KTexts.completedProjects,
                                style: context.textTheme.headlineSmall!.copyWith(
                                  fontSize:
                                      context.isTablet
                                          ? 16
                                          : context.isMobile
                                          ? 18
                                          : 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
