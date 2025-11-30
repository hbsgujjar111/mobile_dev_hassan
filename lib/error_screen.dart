import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import 'utils/extensions/context_extensions.dart';
import 'utils/extensions/num_extensions.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KColors.kTransparent,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LottieBuilder.asset(
                //   KAssets.errorAnimation,
                //   // width: KSizes.kWidth(widthFactor: .8),
                // ),
                KSizes.spaceBtwItems.h,
                Text("Oh no!", style: context.textTheme.headlineLarge!.copyWith(color: KColors.error)),
                KSizes.spaceBtwItems.h,
                Text(
                  error ?? "Oops! Something went wrong.",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium,
                ),
                KSizes.spaceBtwItems.h,
                ElevatedButton.icon(
                  onPressed: () => (),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Start Over"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    backgroundColor: KColors.error,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
