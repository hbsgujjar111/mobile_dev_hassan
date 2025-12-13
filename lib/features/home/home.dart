import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/appbar/responsive_appbar.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/extensions/context_extensions.dart';
import '../education/education_section.dart';
import '../experience/experience_section.dart';
import '../footer/footer.dart';
import '../project/projects_section.dart';
import '../skills/skills_section.dart';
import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/image_flip.dart';
import 'widgets/main_section.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final ScrollController _scrollController = ScrollController();

  double mainHeight = 0;
  double aboutHeight = 0;
  double combinedHeight = 0;
  double _previousOffset = 0.0;

  @override
  void initState() {
    super.initState();

    // Scroll listener for flip progress & floating AppBar
    _scrollController.addListener(() {
      setState(() {}); // rebuild for flip
      _onScroll();
    });

    // Safe measurement of section heights
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeightsSafe());
  }

  /// Measure section heights repeatedly until valid
  void _measureHeightsSafe() {
    final mainCtx = AppConstants.mainSectionKey.currentContext;
    final aboutCtx = AppConstants.aboutSectionKey.currentContext;

    if (mainCtx == null || aboutCtx == null) {
      // try next frame
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeightsSafe());
      return;
    }

    final mainBox = mainCtx.findRenderObject() as RenderBox;
    final aboutBox = aboutCtx.findRenderObject() as RenderBox;

    mainHeight = mainBox.size.height;
    aboutHeight = aboutBox.size.height;
    combinedHeight = mainHeight + (aboutHeight / 1);

    setState(() {}); // heights ready → rebuild flip card
  }

  /// Scroll progress for flip animation (0 → 1)
  double flipProgress() {
    if (!_scrollController.hasClients || combinedHeight == 0) return 0.0;
    return (_scrollController.offset / combinedHeight).clamp(0.0, 1);
  }

  /// Show flip card only during first 2 sections
  bool showFlipCard() {
    if (!_scrollController.hasClients || combinedHeight == 0) return false;
    return _scrollController.offset <= (combinedHeight / 1.5);
  }

  /// Floating AppBar visibility
  void _onScroll() {
    final notifier = ref.read(scrollVisibilityProvider.notifier);
    final offset = _scrollController.hasClients ? _scrollController.offset : 0.0;

    if (offset > _previousOffset + 20) {
      if (ref.read(scrollVisibilityProvider)) notifier.hide();
    } else if (offset < _previousOffset - 20) {
      if (!ref.read(scrollVisibilityProvider)) notifier.show();
    }
    _previousOffset = offset;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showNavItems = ref.watch(scrollVisibilityProvider);

    final isMobile = context.isMobile;
    final isTablet = context.isTablet;
    final isDesktop = !isMobile && !isTablet;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Stack covering first 2 sections
                if (isDesktop)
                  SizedBox(
                    height: combinedHeight,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            MainSection(key: AppConstants.mainSectionKey),
                            AboutSection(key: AppConstants.aboutSectionKey),
                          ],
                        ),
                        if (!context.isTablet && !context.isMobile)
                          if (showFlipCard())
                            ImageFlip(progress: flipProgress(), scrollOffset: _scrollController.offset),
                      ],
                    ),
                  ),

                if (!isDesktop) ...[
                  MainSection(key: AppConstants.mainSectionKey),
                  AboutSection(key: AppConstants.aboutSectionKey),
                ],
                SkillsSection(key: AppConstants.skillsSectionKey),
                ExperienceSection(key: AppConstants.experienceSectionKey),
                ProjectsSection(key: AppConstants.projectSectionKey),
                EducationSection(key: AppConstants.educationSectionKey),
                ContactSection(key: AppConstants.contactSectionKey),
                Footer(),
              ],
            ),
          ),

          /// Floating AppBar
          AnimatedAlign(
            alignment: showNavItems ? Alignment.topCenter : Alignment.bottomCenter,
            duration: const Duration(milliseconds: 300),
            child: const ResponsiveAppbar(),
          ),
        ],
      ),
    );
  }
}
