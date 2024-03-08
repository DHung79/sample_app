import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../logger/logger.dart';
import '../screens/coming_soon/coming_soon_screen.dart';
import '../screens/feed/feed_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/user/user_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'route_names.dart';

String currentRoute = '';
String previousRoute = '';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: initialRoute,
      builder: (BuildContext context, GoRouterState state) {
        if (currentRoute != previousRoute) {
          previousRoute = currentRoute;
        }
        currentRoute = state.uri.toString();
        // logDebug('previousRoute: $previousRoute');
        // logDebug('currentRoute: $currentRoute');
        if (previousRoute.isEmpty) {
          return const SplashScreen();
        } else {
          return const HomeScreen();
        }
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
        GoRoute(
          path: userRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _screenFor(
              state: state,
              route: userRoute,
              child: const UserScreen(),
            );
          },
        ),
        GoRoute(
          path: feedRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return _screenFor(
              state: state,
              route: feedRoute,
              child: const FeedScreen(),
            );
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    logDebug('Route error builder : ${state.uri.toString()}');
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
