import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutAppBar extends StatelessWidget {
  final Color? backgroundColor;
  final Color? systemNavigationBarColor;
  final Color? systemNavigationBarDividerColor;
  final Color? statusBarColor;
  final Widget? child;
  const LayoutAppBar({
    Key? key,
    this.backgroundColor = Colors.blueAccent,
    this.systemNavigationBarColor = Colors.blueAccent,
    this.systemNavigationBarDividerColor,
    this.statusBarColor = Colors.blueAccent,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: systemNavigationBarColor,
      ),
      flexibleSpace: child,
    );
  }
}
