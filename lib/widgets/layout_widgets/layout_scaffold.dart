import 'package:flutter/material.dart';

class LayoutScaffold extends StatelessWidget {
  final Widget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget body;
  final Widget? bottomNavigationBar;
  const LayoutScaffold({
    super.key,
    this.appBar,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    required this.body,
    this.bottomNavigationBar,
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
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
