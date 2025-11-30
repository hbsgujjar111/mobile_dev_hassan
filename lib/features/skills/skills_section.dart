import 'package:flutter/material.dart';

import '../../common/widgets/cards/hover_card.dart';
import '../../common/widgets/chips/custom_chip.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../../utils/extensions/context_extensions.dart';
import 'notifiers/skills_notifier.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: (context.isTablet || context.isMobile) ? context.width * .9 : context.width * .8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: KSizes.spaceBtwSections),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: KSizes.spaceBtwSections,
            children: [
              Text(KTexts.mySkills.toUpperCase(), style: context.textTheme.headlineLarge),

              Wrap(
                spacing: KSizes.spaceBtwItems,
                runSpacing: KSizes.spaceBtwItems,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children:
                    skillsList
                        .map(
                          (skill) => HoverCard(
                            constraints: BoxConstraints(maxWidth: 380, minWidth: 380, minHeight: 280),
                            child: Column(
                              spacing: KSizes.spaceBtwItems / 2,
                              children: [
                                Text(skill.title ?? "---", style: context.textTheme.titleLarge),
                                KChip(clipItems: skill.skills ?? []),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
