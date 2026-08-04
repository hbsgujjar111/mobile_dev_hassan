import 'package:flutter/material.dart';

import '../../../common/styles/shadow_styles.dart';
import '../../../common/widgets/containers/circular_container.dart';
import '../../../common/widgets/images/custom_network_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/helpers/url_launcher_helper.dart';
import '../models/package_model.dart';

class PackageCard extends StatelessWidget {
  final PackageModel package;

  const PackageCard({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;

    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: isDark ? KColors.darkContainer : KColors.lightContainer,
        borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
        boxShadow: isDark ? KShadowStyle.cardShadowDimDark : KShadowStyle.cardShadowDimLight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Stylized IDE Code Terminal Header
            Container(
              color: isDark ? KColors.blackColor : KColors.neutralSwatch.shade900,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                spacing: KSizes.spaceBtwItems / 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Simulated window controls
                  Row(
                    spacing: KSizes.spaceBtwItems / 4,
                    children: [
                      KCircularContainer(backgroundColor: KColors.error, width: 8, height: 8),
                      KCircularContainer(backgroundColor: KColors.warning, width: 8, height: 8),
                      KCircularContainer(backgroundColor: KColors.success, width: 8, height: 8),
                    ],
                  ),

                  /// Syntax-highlighted YAML block
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "dependencies:\n  ",
                          style: context.textTheme.labelSmall!.copyWith(color: KColors.primarySwatch.shade100),
                        ),
                        TextSpan(
                          text: "${package.name}: ",
                          style: context.textTheme.labelSmall!.copyWith(color: KColors.secondarySwatch.shade300),
                        ),
                        TextSpan(
                          text: "any",
                          style: context.textTheme.labelSmall!.copyWith(color: KColors.successSwatch.shade200),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Details & Action Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: KSizes.spaceBtwItems / 2,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Package Name
                  Text(
                    package.name,
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),

                  /// Description
                  Text(package.description, style: context.textTheme.bodySmall),

                  /// Dynamic PNG Badges from Shields.io
                  Wrap(
                    spacing: KSizes.spaceBtwItems / 2,
                    runSpacing: KSizes.spaceBtwItems / 2,
                    children: [
                      KNetworkImage(imageUrl: "https://img.shields.io/pub/v/${package.name}.png"),
                      KNetworkImage(imageUrl: "https://img.shields.io/pub/likes/${package.name}.png"),
                      KNetworkImage(imageUrl: "https://img.shields.io/pub/points/${package.name}.png"),
                    ],
                  ),

                  /// Action Button
                  ElevatedButton(
                    onPressed: () async => UrlLauncherHelper.openLink(package.url),
                    child: const Text(KTexts.viewOnPubDev),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
