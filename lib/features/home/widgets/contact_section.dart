import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/widgets/cards/hover_card.dart';
import '../../../common/widgets/cards/hover_icon_card.dart';
import '../../../common/widgets/layouts/listview_layout.dart';
import '../../../common/widgets/text/vertical_icon_column_text.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../../utils/helpers/url_launcher_helper.dart';
import '../../contact/notifiers/contact_notifier.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Center(
      child: SizedBox(
        width: (context.isMobile || context.isTablet) ? context.width * .9 : context.width * .8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: KSizes.spaceBtwSections,
            children: [
              Column(
                spacing: KSizes.spaceBtwItems / 2,
                children: [
                  Text(KTexts.letsWorkTogether.toUpperCase(), style: context.textTheme.headlineLarge),
                  Text(KTexts.contactSubTitle, textAlign: TextAlign.center, style: context.textTheme.bodyMedium),
                  Text(
                    "★ ${KTexts.repliesWith24Hours}",
                    style: context.textTheme.labelLarge!.copyWith(
                      color: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                ],
              ),

              /// contact icons
              Wrap(
                spacing: KSizes.spaceBtwItems / 2,
                runSpacing: KSizes.spaceBtwItems / 2,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  HoverCard(
                    padding: 16,
                    constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
                    child: VerticalIconColumnText(
                      subTitle: KTexts.address,
                      icon: Icons.location_on_rounded,
                      iconColor: isDark ? KColors.blackColor : KColors.kWhite,
                      iconBgColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                  HoverCard(
                    padding: 16,
                    constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
                    onTap: () => UrlLauncherHelper.launchEmail(toEmail: myGmail),
                    child: VerticalIconColumnText(
                      subTitle: myGmail,
                      icon: Icons.email_rounded,
                      iconColor: isDark ? KColors.blackColor : KColors.kWhite,
                      iconBgColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                  HoverCard(
                    padding: 16,
                    constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
                    onTap: () => UrlLauncherHelper.launchPhoneCall(myNumber),
                    child: VerticalIconColumnText(
                      subTitle: myNumber,
                      icon: Icons.local_phone_rounded,
                      iconColor: isDark ? KColors.blackColor : KColors.kWhite,
                      iconBgColor: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                ],
              ),

              /// why hire me
              Column(
                spacing: KSizes.spaceBtwItems,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      KTexts.whyHireMe.toUpperCase(),
                      style: context.textTheme.headlineLarge!.copyWith(fontSize: 32),
                    ),
                  ),

                  Text(
                    KTexts.because.toUpperCase(),
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),

                  KSeparatedListView(
                    itemCount: whyHireMe.length,
                    padding: EdgeInsets.only(left: 60),
                    separatorBuilder: (_, _) => (KSizes.spaceBtwItems / 4).h,
                    itemBuilder: (_, i) => Row(
                      spacing: KSizes.spaceBtwItems / 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_rounded, size: 16, color: isDark ? KColors.primaryDark : KColors.primaryLight),

                        Expanded(child: Text(whyHireMe[i], maxLines: 3, style: context.textTheme.bodySmall)),
                      ],
                    ),
                  ),
                ],
              ),

              /// get in touch
              Column(
                spacing: KSizes.spaceBtwItems,
                children: [
                  Text(KTexts.getInTouch.toUpperCase(), style: context.textTheme.headlineLarge!.copyWith(fontSize: 32)),

                  /// social media icons
                  Wrap(
                    spacing: KSizes.spaceBtwItems / 2,
                    runSpacing: KSizes.spaceBtwItems / 2,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      HoverIconCard(
                        title: KTexts.whatsapp,
                        icon: FontAwesomeIcons.whatsapp,
                        iconColor: KColors.whatsapp,
                        onTap: () => UrlLauncherHelper.launchWhatsApp(),
                      ),
                      HoverIconCard(
                        title: KTexts.linkedIn,
                        icon: FontAwesomeIcons.linkedin,
                        iconColor: KColors.linkedIn,
                        onTap: () => UrlLauncherHelper.openLink(linkedInURL),
                      ),
                      HoverIconCard(
                        title: KTexts.stackOverflow,
                        icon: FontAwesomeIcons.stackOverflow,
                        iconColor: KColors.stackOverflow,
                        onTap: () => UrlLauncherHelper.openLink(stackOverflowURL),
                      ),
                      HoverIconCard(
                        title: KTexts.gitHub,
                        icon: FontAwesomeIcons.github,
                        iconColor: isDark ? KColors.kWhite : KColors.gitHub,
                        onTap: () => UrlLauncherHelper.openLink(gitHubURL),
                      ),
                    ],
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
