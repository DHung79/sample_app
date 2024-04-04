import 'package:flutter/material.dart';
import '../modules/translate/translate_screen.dart';
import '../modules/vk_app/vk_app_screen.dart';
import '../utils/logger/logger.dart';
import '../modules/coming_soon/coming_soon_screen.dart';
import '../modules/feed/feed_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/user/user_screen.dart';
import '../modules/splash/splash_screen.dart';
import 'route_names.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      name: initialRoute,
      path: initialRoute,
      builder: (BuildContext context, GoRouterState state) {
        final currentRoute = state.uri.toString();
        if (currentRoute == initialRoute) {
          return const SplashScreen();
        } else {
          return const HomeScreen();
        }
      },
    ),
    GoRoute(
      name: homeRoute,
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
      name: userRoute,
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
      name: feedRoute,
      path: feedRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _screenFor(
          state: state,
          route: feedRoute,
          child: const FeedScreen(),
        );
      },
    ),
    GoRoute(
      name: shippingRoute,
      path: shippingRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _screenFor(
          state: state,
          route: shippingRoute,
          child: const TranslateScreen(),
        );
      },
    ),
    GoRoute(
      name: vkAppRoute,
      path: vkAppRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _screenFor(
          state: state,
          route: vkAppRoute,
          child: const VKAppScreen(),
        );
      },
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
