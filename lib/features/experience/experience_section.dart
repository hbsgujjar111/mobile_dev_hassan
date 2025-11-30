import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeline_list/timeline_list.dart';

import '../../common/styles/shadow_styles.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../../utils/extensions/context_extensions.dart';
import 'notifiers/experience_notifier.dart';
import 'widgets/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Center(
      child: SizedBox(
        width: (context.isTablet || context.isMobile) ? context.width * .9 : context.width * .8,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final bool isSmallScreen = screenWidth < 600;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: KSizes.spaceBtwSections,
                children: [
                  Text(KTexts.experience.toUpperCase(), style: context.textTheme.headlineLarge),
                  Timeline.builder(
                    context: context,
                    markerCount: experiences.length,
                    horizontalPadding: 0,
                    properties: TimelineProperties(
                      iconSize: KSizes.iconXLg,
                      iconAlignment: MarkerIconAlignment.center,
                      lineColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                      timelinePosition: isSmallScreen ? TimelinePosition.start : TimelinePosition.center,
                    ),
                    markerBuilder:
                        (context, i) => Marker(
                          position:
                              isSmallScreen
                                  ? MarkerPosition.left
                                  : i % 2 == 0
                                  ? MarkerPosition.left
                                  : MarkerPosition.right,
                          icon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isDark ? KColors.linearGradientDark : KColors.linearGradientLight,
                              boxShadow: i == 0 ? KShadowStyle.cardShadow : KShadowStyle.cardShadowDimLight,
                              border: Border.all(
                                color:
                                    isDark
                                        ? i == 0
                                            ? KColors.primaryDarkSwatch.shade800
                                            : KColors.primaryDarkSwatch.shade200
                                        : i == 0
                                        ? KColors.primaryLightSwatch.shade800
                                        : KColors.primaryLightSwatch.shade200,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: FaIcon(
                                i == 0 ? FontAwesomeIcons.locationDot : FontAwesomeIcons.briefcase,
                                color: KColors.kWhite,
                                size: KSizes.iconSm,
                              ),
                            ),
                          ),
                          child: ExperienceCard(isSmallScreen: isSmallScreen, data: experiences[i]),
                        ),
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
