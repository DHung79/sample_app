import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class LayoutScaffold extends StatelessWidget {
  final Widget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget body;
  const LayoutScaffold({
    super.key,
    this.appBar,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: appBar!,
            )
          : null,
      body: Stack(
        children: [
          body,
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BottomNavBar(),
            ],
          )
        ],
      ),
    );
  }
}
