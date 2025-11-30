import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/num_extensions.dart';

class KSeparatedListView extends StatelessWidget {
  const KSeparatedListView({
    super.key,
    required this.itemCount,
    this.padding,
    this.physics,
    this.separatorBuilder,
    required this.itemBuilder,
    this.scrollDirection,
  });

  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: padding ?? EdgeInsets.zero,
      physics: physics ?? NeverScrollableScrollPhysics(),
      separatorBuilder: separatorBuilder ?? (_, _) => KSizes.defaultSpace.h,
      itemBuilder: itemBuilder,
    );
  }
}
