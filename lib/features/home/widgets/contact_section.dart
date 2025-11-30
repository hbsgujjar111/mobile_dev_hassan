import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/widgets/cards/hover_card.dart';
import '../../../common/widgets/cards/hover_icon_card.dart';
import '../../../common/widgets/text/vertical_icon_column_text.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/helpers/url_launcher_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: KSizes.spaceBtwSections,
            children: [
              Text(KTexts.contactMe.toUpperCase(), style: context.textTheme.headlineLarge),

              /// contact icons
              Wrap(
                spacing: KSizes.spaceBtwItems / 2,
                runSpacing: KSizes.spaceBtwItems / 2,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  HoverCard(
                    constraints: BoxConstraints(maxWidth: 350, minWidth: 250),
                    child: VerticalIconColumnText(
                      subTitle: KTexts.address,
                      icon: Icons.location_on_rounded,
                      iconColor: isDark ? KColors.blackColor : KColors.kWhite,
                      iconBgColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                  HoverCard(
                    constraints: BoxConstraints(maxWidth: 350, minWidth: 250),
                    onTap: () => UrlLauncherHelper.launchEmail(toEmail: AppConstants.myGmail),
                    child: VerticalIconColumnText(
                      subTitle: AppConstants.myGmail,
                      icon: Icons.email_rounded,
                      iconColor: isDark ? KColors.blackColor : KColors.kWhite,
                      iconBgColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                  HoverCard(
                    constraints: BoxConstraints(maxWidth: 350, minWidth: 250),
                    onTap: () => UrlLauncherHelper.launchPhoneCall(AppConstants.myNumber),
                    child: VerticalIconColumnText(
                      subTitle: AppConstants.myNumber,
                      icon: Icons.local_phone_rounded,
                      iconColor: isDark ? KColors.blackColor : KColors.kWhite,
                      iconBgColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                ],
              ),

              Text(KTexts.getInTouch.toUpperCase(), style: context.textTheme.headlineLarge),

              /// social media icons
              Wrap(
                spacing: KSizes.spaceBtwItems / 2,
                runSpacing: KSizes.spaceBtwItems / 2,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  HoverIconCard(
                    title: KTexts.linkedIn,
                    icon: FontAwesomeIcons.linkedin,
                    iconColor: KColors.linkedIn,
                    onTap: () => UrlLauncherHelper.openLink(AppConstants.linkedInURL),
                  ),
                  HoverIconCard(
                    title: KTexts.stackOverflow,
                    icon: FontAwesomeIcons.stackOverflow,
                    iconColor: KColors.stackOverflow,
                    onTap: () => UrlLauncherHelper.openLink(AppConstants.stackOverflowURL),
                  ),
                  HoverIconCard(
                    title: KTexts.gitHub,
                    icon: FontAwesomeIcons.github,
                    iconColor: isDark ? KColors.kWhite : KColors.gitHub,
                    onTap: () => UrlLauncherHelper.openLink(AppConstants.gitHubURL),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
