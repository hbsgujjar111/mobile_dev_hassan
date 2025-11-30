import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../data/providers/theme_provider.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/assets_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/shadow_styles.dart';
import '../images/circular_image.dart';
import '../text/vertical_flip_text.dart';

class ScrollVisibilityNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void hide() => state = false;

  void show() => state = true;
}

final scrollVisibilityProvider = NotifierProvider<ScrollVisibilityNotifier, bool>(ScrollVisibilityNotifier.new);

/// Local UI state for menu open/close
final menuOpenProvider = StateProvider<bool>((ref) => false);

class ResponsiveAppbar extends ConsumerWidget {
  const ResponsiveAppbar({super.key, this.breakpoint = 900});

  final double breakpoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = context.isDarkMode;
    final showNavItems = ref.watch(scrollVisibilityProvider);
    final isMenuOpen = ref.watch(menuOpenProvider);
    final toggleMenu = ref.read(menuOpenProvider.notifier);

    final isMobile = MediaQuery.of(context).size.width < breakpoint;

    // Smooth container height & radius
    final containerHeight = isMobile ? (isMenuOpen ? 320.0 : 56.0) : 56.0;
    final borderRadius = 28.0;

    final menuList = [
      VerticalFlipText(text: KTexts.home, onTap: () => KHelperFunctions.scrollToSection(AppConstants.mainSectionKey)),
      VerticalFlipText(text: KTexts.about, onTap: () => KHelperFunctions.scrollToSection(AppConstants.aboutSectionKey)),
      VerticalFlipText(
        text: KTexts.education,
        onTap: () => KHelperFunctions.scrollToSection(AppConstants.educationSectionKey),
      ),
      VerticalFlipText(
        text: KTexts.mySkills,
        onTap: () => KHelperFunctions.scrollToSection(AppConstants.skillsSectionKey),
      ),
      VerticalFlipText(
        text: KTexts.experience,
        onTap: () => KHelperFunctions.scrollToSection(AppConstants.experienceSectionKey),
      ),
      VerticalFlipText(
        text: KTexts.project,
        onTap: () => KHelperFunctions.scrollToSection(AppConstants.projectSectionKey),
      ),
      VerticalFlipText(
        text: KTexts.contactMe,
        onTap: () => KHelperFunctions.scrollToSection(AppConstants.contactSectionKey),
      ),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      height: containerHeight,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
      decoration: BoxDecoration(
        color: isDark ? KColors.darkContainerSecondary : KColors.lightContainerSecondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        boxShadow: isDark ? KShadowStyle.cardShadowDimDark : KShadowStyle.cardShadowDimLight,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: Column(
            spacing: isMenuOpen ? KSizes.spaceBtwItems / 2 : 0.0,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Expanded menu on mobile
              AnimatedOpacity(
                opacity: isMobile ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child:
                    isMenuOpen
                        ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwItems / 2),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: KSizes.spaceBtwItems / 2,
                              children: menuList,
                            ),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),

              // Top Row: Icon + Nav / Menu + Theme toggle
              Row(
                spacing: (isMobile || !showNavItems) ? KSizes.spaceBtwSections : KSizes.spaceBtwItems,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // App Icon
                  const KCircularImage(image: KAssets.appIcon, fit: BoxFit.cover, width: 40, height: 40, padding: 0),

                  // Desktop nav
                  if (!isMobile)
                    Row(mainAxisSize: MainAxisSize.min, spacing: KSizes.spaceBtwItems / 1.5, children: menuList),

                  // Right-side icons: theme + menu
                  Row(
                    spacing: isMenuOpen ? KSizes.spaceBtwItems / 2 : 0.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Theme toggle always visible
                      AnimatedOpacity(
                        opacity: (!isMobile || isMenuOpen) ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Visibility(
                          visible: (!isMobile || isMenuOpen),
                          child: IconButton(
                            icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder:
                                  (child, anim) => RotationTransition(
                                    turns:
                                        child.key == const ValueKey('dark')
                                            ? Tween(begin: 1.0, end: 0.75).animate(anim)
                                            : anim,
                                    child: child,
                                  ),
                              child: Icon(
                                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                                // key: ValueKey(themeMode),
                              ),
                            ),
                            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
                          ),
                        ),
                      ),

                      // Mobile menu button
                      if (isMobile)
                        IconButton(
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder:
                                (child, anim) =>
                                    RotationTransition(turns: Tween(begin: 0.75, end: 1.0).animate(anim), child: child),
                            child: Icon(isMenuOpen ? Icons.close : Icons.menu, key: ValueKey(isMenuOpen)),
                          ),
                          onPressed: () => toggleMenu.state = !isMenuOpen,
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
