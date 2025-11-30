import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/styles/shadow_styles.dart';
import '../../../common/widgets/chips/custom_chip.dart';
import '../../../common/widgets/icons/hover_icon.dart';
import '../../../common/widgets/layouts/listview_layout.dart';
import '../../../utils/constants/assets_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../../utils/helpers/url_launcher_helper.dart';
import '../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.data});

  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;
    return Container(
      width: context.width,
      constraints: BoxConstraints(minHeight: context.height * .8),
      decoration: BoxDecoration(
        color: isDark ? KColors.darkContainer : KColors.lightContainer,
        borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
        boxShadow: isDark ? KShadowStyle.cardShadowDimDark : KShadowStyle.cardShadowDimLight,
      ),
      padding: EdgeInsets.all((context.isTablet || context.isMobile) ? 20 : 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: KSizes.spaceBtwItems,
        children: [
          if (context.isTablet || context.isMobile)
            SizedBox(
              height: 400,
              width: context.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                child: Image.network(data.graphic ?? "", fit: BoxFit.cover),
              ),
            ),

          ///
          Row(
            spacing: KSizes.spaceBtwItems,
            children: [
              Expanded(
                child: Column(
                  spacing: KSizes.spaceBtwItems,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        data.title ?? "---",
                        style: context.textTheme.headlineMedium!.copyWith(
                          fontSize: 34,
                          color: isDark ? KColors.primaryDark : KColors.primaryLight,
                        ),
                      ),
                    ),

                    if (data.description?.isNotEmpty ?? false)
                      KSeparatedListView(
                        itemCount: data.description!.length,
                        separatorBuilder: (_, _) => (KSizes.spaceBtwItems / 4).h,
                        itemBuilder: (_, i) => Text(data.description![i], style: context.textTheme.bodySmall),
                      ),

                    if (data.achievements?.isNotEmpty ?? false)
                      KSeparatedListView(
                        itemCount: data.achievements!.length,
                        separatorBuilder: (_, _) => (KSizes.spaceBtwItems / 4).h,
                        itemBuilder:
                            (_, i) => Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "★ ",
                                    style: context.textTheme.bodySmall!.copyWith(color: KColors.warning),
                                  ),
                                  TextSpan(text: data.achievements![i], style: context.textTheme.bodySmall),
                                ],
                              ),
                            ),
                      ),

                    if (data.technologies?.isNotEmpty ?? false) KChip(clipItems: data.technologies ?? []),

                    Wrap(
                      spacing: KSizes.spaceBtwItems / 2,
                      runSpacing: KSizes.spaceBtwItems / 2,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        if (data.android != null)
                          HoverIcon(
                            icon: FontAwesomeIcons.googlePlay,
                            iconColor: KColors.android,
                            isImage: true,
                            assetPath: KAssets.playStore,
                            tooltipText: KTexts.googlePlayStore,
                            onTap: () => UrlLauncherHelper.openLink(data.android!),
                          ),
                        if (data.apple != null)
                          HoverIcon(
                            icon: FontAwesomeIcons.appStoreIos,
                            iconColor: KColors.appStore,
                            tooltipText: KTexts.appleAppStore,
                            onTap: () => UrlLauncherHelper.openLink(data.apple!),
                          ),
                        if (data.huawei != null)
                          HoverIcon(
                            icon: FontAwesomeIcons.mobile,
                            iconColor: KColors.huawei,
                            isImage: true,
                            assetPath: KAssets.huaweiAppGallery,
                            tooltipText: KTexts.huaweiAppGallery,
                            onTap: () => UrlLauncherHelper.openLink(data.huawei!),
                          ),
                        if (data.web != null)
                          HoverIcon(
                            icon: FontAwesomeIcons.globe,
                            iconColor: KColors.web,
                            tooltipText: KTexts.web,
                            onTap: () => UrlLauncherHelper.openLink(data.web!),
                          ),
                        if (data.windows != null)
                          HoverIcon(
                            icon: FontAwesomeIcons.windows,
                            iconColor: KColors.windows,
                            tooltipText: KTexts.windowsDesktop,
                            onTap: () => UrlLauncherHelper.openLink(data.windows!),
                          ),
                        if (data.mac != null)
                          HoverIcon(
                            icon: FontAwesomeIcons.apple,
                            iconColor: KColors.appStore,
                            tooltipText: KTexts.macOS,
                            onTap: () => UrlLauncherHelper.openLink(data.mac!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!context.isTablet && !context.isMobile)
                Expanded(
                  child: SizedBox(
                    height: context.height * .8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                      child: Image.network(data.graphic ?? "", fit: BoxFit.cover),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
