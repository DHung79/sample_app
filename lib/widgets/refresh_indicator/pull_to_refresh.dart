import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class PullToRefresh extends StatelessWidget {
  final Widget child;
  final Widget? headerChild;
  final Future<void> Function() onRefresh;
  final Widget Function(
    BuildContext context,
    IndicatorController controller,
  ) buildRefresh;
  const PullToRefresh({
    Key? key,
    required this.child,
    this.headerChild,
    required this.onRefresh,
    required this.buildRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: onRefresh,
      builder: (context, child, controller) {
        return Stack(
          children: <Widget>[
            Transform.translate(
              offset: const Offset(0, 0),
              child: child,
            ),
            buildRefresh(
              context,
              controller,
            ),
          ],
        );
      },
      child: child,
    );
  }
}
