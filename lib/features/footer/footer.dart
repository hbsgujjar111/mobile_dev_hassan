import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
import '../../utils/extensions/context_extensions.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: KSizes.spaceBtwSections),
      child: Text(KTexts.footerText, style: context.textTheme.labelSmall),
    );
  }
}
