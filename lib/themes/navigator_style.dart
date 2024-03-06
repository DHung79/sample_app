import 'package:flutter/material.dart';

class NavigatorStyle {
  static Animatable<Offset> pushRight = Tween(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  );

  static Animatable<Offset> pushLeft = Tween(
    begin: const Offset(-1.0, 0.0),
    end: Offset.zero,
  );

  static Animatable<Offset> pushUp = Tween(
    begin: const Offset(0.0, 1.0),
    end: Offset.zero,
  );

  static Animatable<Offset> pushDown = Tween(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  );

  static navigatorTo({
    required BuildContext context,
    required int transitionDuration,
    required Widget toScreen,
    Animatable<Offset>? tween,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final offsetAnimation = animation.drive(
            tween ??
                Tween(
                  begin: begin,
                  end: end,
                ),
          );
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        pageBuilder: (context, animation1, animation2) {
          return toScreen;
        },
        transitionDuration: Duration(milliseconds: transitionDuration),
        reverseTransitionDuration: Duration(milliseconds: transitionDuration),
      ),
    );
  }

  static animatedDialog({
    required BuildContext context,
    required int transitionDuration,
    required Widget dialog,
    Animatable<Offset>? tween,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (buildContext, animation, secondaryAnimation) {
        return dialog;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final offsetAnimation = animation.drive(
          tween ??
              Tween(
                begin: begin,
                end: end,
              ),
        );
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: transitionDuration),
    );
  }
}
