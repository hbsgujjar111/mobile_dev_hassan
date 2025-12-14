import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/styles/shadow_styles.dart';
import '../../../common/widgets/images/custom_asset_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/routes/app_route_names.dart';
import '../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.data});

  final ProjectModel data;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;
    return Container(
      width: context.width,
      // height: 500,
      decoration: BoxDecoration(
        color: isDark ? KColors.darkContainer : KColors.lightContainer,
        borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
        boxShadow: isDark ? KShadowStyle.cardShadowDimDark : KShadowStyle.cardShadowDimLight,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: KSizes.spaceBtwItems / 2,
        children: [
          /// image
          ClipRRect(
            borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
            child: KAssetImage(path: data.graphic ?? ""),
          ),

          /// title
          Text(
            data.title ?? "---",
            style: context.textTheme.headlineMedium!.copyWith(
              fontSize: 34,
              color: isDark ? KColors.primaryDark : KColors.primaryLight,
            ),
          ),

          /// description
          if (data.description?.isNotEmpty ?? false)
            Text(
              data.description!.join(" "),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall,
            ),

          /// read more button
          ElevatedButton(
            onPressed: () => context.pushNamed(KAppRouteNames.projectDetailRoute, extra: data),
            child: Text(KTexts.readMore),
          ),
        ],
      ),
    );
  }
}
