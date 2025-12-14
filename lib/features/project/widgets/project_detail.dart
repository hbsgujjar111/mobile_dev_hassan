import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/chips/custom_chip.dart';
import '../../../common/widgets/icons/hover_icon.dart';
import '../../../common/widgets/images/custom_asset_image.dart';
import '../../../common/widgets/layouts/listview_layout.dart';
import '../../../utils/constants/assets_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../../utils/helpers/url_launcher_helper.dart';
import '../models/project_model.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({super.key, required this.data});

  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pop(),
        label: Text(KTexts.backToHome),
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: KSizes.spaceBtwSections,
              horizontal: (context.isMobile || context.isTablet) ? context.width * .1 : context.width * .2,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: KSizes.spaceBtwItems,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                SizedBox(
                  width: context.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
                    child: KAssetImage(path: data.graphic ?? ""),
                  ),
                ),

                /// title
                Center(
                  child: Text(
                    data.title ?? "---",
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontSize: 34,
                      color: isDark ? KColors.primaryDark : KColors.primaryLight,
                    ),
                  ),
                ),

                /// description
                if (data.description?.isNotEmpty ?? false)
                  KSeparatedListView(
                    itemCount: data.description!.length,
                    separatorBuilder: (_, _) => (KSizes.spaceBtwItems / 4).h,
                    itemBuilder: (_, i) => Text(data.description![i], style: context.textTheme.bodySmall),
                  ),

                /// achievements
                if (data.achievements?.isNotEmpty ?? false)
                  Column(
                    spacing: KSizes.spaceBtwItems / 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KTexts.achievements,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: isDark ? KColors.primaryDark : KColors.primaryLight,
                        ),
                      ),
                      KSeparatedListView(
                        itemCount: data.achievements!.length,
                        separatorBuilder: (_, _) => (KSizes.spaceBtwItems / 4).h,
                        itemBuilder: (_, i) => Text.rich(
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
                    ],
                  ),

                /// technologies
                if (data.technologies?.isNotEmpty ?? false)
                  Column(
                    spacing: KSizes.spaceBtwItems / 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KTexts.technologies,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: isDark ? KColors.primaryDark : KColors.primaryLight,
                        ),
                      ),
                      KChip(clipItems: data.technologies ?? []),
                    ],
                  ),

                /// availability
                Column(
                  spacing: KSizes.spaceBtwItems / 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      KTexts.availableOn,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: isDark ? KColors.primaryDark : KColors.primaryLight,
                      ),
                    ),
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

                /// company
                if (data.company != null && data.company!.isNotEmpty)
                  Column(
                    spacing: KSizes.spaceBtwItems / 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KTexts.company,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: isDark ? KColors.primaryDark : KColors.primaryLight,
                        ),
                      ),
                      Text(data.company ?? "---", style: context.textTheme.bodySmall),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
