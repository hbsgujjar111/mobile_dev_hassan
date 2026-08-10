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

  @override
  void initState() {
    super.initState();

    /// SAFE MEASUREMENT: Rebuilds once only when layout heights are measured
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeightsSafe());
  }

  void _measureHeightsSafe() {
    final mainCtx = AppConstants.mainSectionKey.currentContext;
    final aboutCtx = AppConstants.aboutSectionKey.currentContext;

    if (mainCtx == null || aboutCtx == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeightsSafe());
      return;
    }

    final mainBox = mainCtx.findRenderObject() as RenderBox;
    final aboutBox = aboutCtx.findRenderObject() as RenderBox;

    mainHeight = mainBox.size.height;
    aboutHeight = aboutBox.size.height;
    combinedHeight = mainHeight + aboutHeight;

    setState(() {}); // Measured once at load
  }

  bool showFlipCard(double offset) {
    if (combinedHeight == 0) return false;
    return offset <= (combinedHeight / 1.5);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        // PERFORMANCE WIN: AnimatedBuilder isolates scroll rebuilds to just the ImageFlip!
                        AnimatedBuilder(
                          animation: _scrollController,
                          builder: (context, child) {
                            final offset = _scrollController.hasClients ? _scrollController.offset : 0.0;
                            if (!showFlipCard(offset)) return const SizedBox.shrink();

                            return ImageFlip(scrollController: _scrollController, combinedHeight: combinedHeight);
                          },
                        ),
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
            alignment: Alignment.bottomCenter,
            duration: const Duration(milliseconds: 300),
            child: const ResponsiveAppbar(),
          ),
        ],
      ),
    );
  }
}
