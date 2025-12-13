import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/widgets/cards/hover_card.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/helpers/helper_functions.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final isMobile = context.isMobile;
    final isTablet = context.isTablet;
    final isDesktop = !isMobile && !isTablet;

    return Center(
      child: SizedBox(
        width: (context.isMobile || context.isTablet) ? context.width * .9 : context.width * .8,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: isDesktop ? KSizes.spaceBtwSections * 1.5 : KSizes.spaceBtwSections),
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
                    Text(KTexts.aboutMeContent, textAlign: TextAlign.justify, style: context.textTheme.bodyMedium),

                    /// experience and project count
                    HoverCard(
                      constraints: BoxConstraints(minWidth: context.width * .24, maxWidth: context.width * .9),
                      child: Wrap(
                        spacing: KSizes.spaceBtwItems,
                        runSpacing: KSizes.spaceBtwItems,
                        children: [
                          /// experience
                          Column(
                            spacing: KSizes.spaceBtwItems / 2,
                            children: [
                              Text(
                                KTexts.experienceCount,
                                style: context.textTheme.headlineLarge!.copyWith(
                                  color: isDark ? KColors.primaryDark : KColors.primaryLight,
                                  fontSize: context.isTablet
                                      ? 44
                                      : context.isMobile
                                      ? 38
                                      : 50,
                                ),
                              ),
                              Text(
                                KTexts.yearsOfExperience,
                                style: context.textTheme.headlineSmall!.copyWith(
                                  fontSize: context.isTablet
                                      ? 16
                                      : context.isMobile
                                      ? 18
                                      : 20,
                                ),
                              ),
                            ],
                          ),

                          /// project
                          Column(
                            spacing: KSizes.spaceBtwItems / 2,
                            children: [
                              Text(
                                KTexts.projectCount,
                                style: context.textTheme.headlineLarge!.copyWith(
                                  color: isDark ? KColors.primaryDark : KColors.primaryLight,
                                  fontSize: context.isTablet
                                      ? 44
                                      : context.isMobile
                                      ? 38
                                      : 50,
                                ),
                              ),
                              Text(
                                KTexts.completedProjects,
                                style: context.textTheme.headlineSmall!.copyWith(
                                  fontSize: context.isTablet
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

                    /// download resume & contact buttons
                    Wrap(
                      spacing: KSizes.spaceBtwItems / 2,
                      runSpacing: KSizes.spaceBtwItems / 2,
                      alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
                      children: [
                        /// resume
                        SizedBox(
                          width: 220,
                          child: OutlinedButton(
                            onPressed: () => KHelperFunctions.downloadFile(),
                            child: Row(
                              spacing: KSizes.spaceBtwItems / 2,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(CupertinoIcons.doc_richtext), Text(KTexts.downloadResume)],
                            ),
                          ),
                        ),

                        /// contact
                        SizedBox(
                          width: 220,
                          child: OutlinedButton(
                            onPressed: () => KHelperFunctions.scrollToSection(AppConstants.contactSectionKey),
                            child: Row(
                              spacing: KSizes.spaceBtwItems / 2,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(FontAwesomeIcons.mobileScreen), Text(KTexts.getInTouch)],
                            ),
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
      ),
    );
  }
}
