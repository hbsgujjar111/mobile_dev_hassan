import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'data/providers/theme_provider.dart';
import 'utils/constants/texts.dart';
import 'utils/routes/app_routes.dart';
import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ProviderScope(
        child: Consumer(
          builder: (_, ref, _) {
            final theme = ref.watch(themeProvider);
            return MaterialApp.router(
              builder:
                  (context, child) => MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
                    child: child!,
                  ),
              title: KTexts.appName,
              themeMode: theme,
              theme: KAppTheme.lightTheme,
              darkTheme: KAppTheme.darkTheme,
              routerConfig: appRoutes,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
