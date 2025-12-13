import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_dev_hassan/common/widgets/images/custom_asset_image.dart';
import 'package:mobile_dev_hassan/utils/constants/assets_strings.dart';

import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/helpers/helper_functions.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final isMobile = context.isMobile;
    final isTablet = context.isTablet;
    final isDesktop = !isMobile && !isTablet;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height,
          maxWidth: (context.isMobile || context.isTablet) ? context.width * .9 : context.width * .8,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections * 1.5),
          child: Column(
            mainAxisAlignment: isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
            spacing: KSizes.spaceBtwSections,

            children: [
              /// ----------------------------------------------------------
              /// MOBILE / TABLET IMAGE (SHOWN ONLY HERE)
              /// ----------------------------------------------------------
              if (!isDesktop)
                Container(
                  width: 400,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(KSizes.cardRadiusLg)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                    child: KAssetImage(path: KAssets.main),
                  ),
                ),

              /// ----------------------------------------------------------
              /// TEXT CONTENT
              /// ----------------------------------------------------------
              SizedBox(
                width: context.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  spacing: KSizes.spaceBtwItems * 1.2,
                  children: [
                    /// Greeting
                    Text(
                      KHelperFunctions.getGreeting(),
                      style: context.textTheme.headlineMedium!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: KColors.textSecondary.withValues(alpha: .85),
                      ),
                    ),

                    /// "I am"
                    Text(
                      KTexts.iAm,
                      style: context.textTheme.headlineSmall!.copyWith(fontSize: 26, fontWeight: FontWeight.w500),
                    ),

                    /// Name Animation
                    DefaultTextStyle(
                      style: context.textTheme.headlineLarge!.copyWith(
                        fontSize: isDesktop ? 64 : 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            KTexts.hassanBinSalim.toUpperCase(),
                            speed: Durations.short3,
                            textAlign: (isMobile || isTablet) ? TextAlign.center : TextAlign.start,
                          ),
                        ],
                        repeatForever: true,
                      ),
                    ),

                    /// Role Animation
                    SizedBox(
                      height: 60,
                      child: DefaultTextStyle(
                        style: context.textTheme.headlineLarge!.copyWith(
                          fontSize: isDesktop ? 48 : 40,
                          color: isDark ? KColors.primaryDark : KColors.primaryLight,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            ScrambleAnimatedText(
                              KTexts.flutterDeveloper.toUpperCase(),
                              speed: Durations.medium2,
                              textAlign: (isMobile || isTablet) ? TextAlign.center : TextAlign.start,
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    ),

                    /// view work & contact buttons
                    Wrap(
                      spacing: KSizes.spaceBtwItems / 2,
                      runSpacing: KSizes.spaceBtwItems / 2,
                      alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
                      children: [
                        /// project button
                        SizedBox(
                          width: 220,
                          child: OutlinedButton(
                            onPressed: () => KHelperFunctions.scrollToSection(AppConstants.projectSectionKey),
                            child: Row(
                              spacing: KSizes.spaceBtwItems / 2,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(FontAwesomeIcons.laptopCode), Text(KTexts.viewMyWork)],
                            ),
                          ),
                        ),

                        /// contact button
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
