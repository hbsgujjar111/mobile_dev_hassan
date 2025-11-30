import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
          maxWidth: (isMobile || isTablet) ? context.width * .9 : context.width * .8,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
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
                  height: 500,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(KSizes.cardRadiusLg)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                    child: Image.network(
                      "https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp",
                      fit: BoxFit.cover,
                    ),
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
                          TypewriterAnimatedText(KTexts.hassanBinSalim.toUpperCase(), speed: Durations.short3),
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
                            ScrambleAnimatedText(KTexts.flutterDeveloper.toUpperCase(), speed: Durations.medium2),
                          ],
                          repeatForever: true,
                        ),
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
