import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../error_screen.dart';
import '../../features/home/home.dart';
import 'app_route_names.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRoutes = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: KAppRouteNames.homePageRoute,
  errorBuilder: (context, state) => ErrorScreen(error: state.error?.message),
  routes: <RouteBase>[
    /// home screen
    GoRoute(name: KAppRouteNames.homePageRoute, path: KAppRouteNames.homePageRoute, builder: (_, _) => Home()),
  ],
);
