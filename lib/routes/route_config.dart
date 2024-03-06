import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import '../screens/authentication/authentication_screen.dart';
import '../logger/logger.dart';
import '../screens/coming_soon/coming_soon_screen.dart';
import '../screens/home/home_screen.dart';
import 'route_names.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: initialRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: homeRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _screenFor(
              state: state,
              route: homeRoute,
              child: const HomeScreen(),
            );
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    logDebug('error location: ${state.uri.toString()}');
    return const ComingSoonScreen(
      appBarTitle: 'Unknow Route',
    );
  },
);

CustomTransitionPage _screenFor({
  required GoRouterState state,
  required Widget child,
  required String route,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 0),
    reverseTransitionDuration: const Duration(milliseconds: 0),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: Builder(builder: (context) {
          return child;
        }),
      );
    },
  );
}
