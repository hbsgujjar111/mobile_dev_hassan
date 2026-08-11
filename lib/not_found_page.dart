import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/extensions/context_extensions.dart';
import 'utils/constants/sizes.dart';
import 'utils/constants/texts.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            spacing: KSizes.spaceBtwItems,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(KTexts.notFoundPageTitle, style: context.textTheme.headlineLarge!.copyWith(fontSize: 120)),

              Text(KTexts.pageNotFound.toUpperCase(), style: context.textTheme.headlineMedium),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: OutlinedButton(
                  onPressed: () => context.go('/'),
                  child: Row(
                    spacing: KSizes.spaceBtwItems / 2,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Icon(Icons.home_rounded), Text(KTexts.takeMeHome)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
