import 'package:flutter/material.dart';
import 'theme_config.dart';

class Tooltips extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget? child;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  const Tooltips({
    super.key,
    required this.title,
    this.style,
    this.child,
    this.minWidth = 0,
    this.maxWidth = 200,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: WidgetSpan(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight,
          ),
          child: Text(
            title,
            style: style ??
                CustomTextStyle.mediumSub(
                  color: ColorPalettes.nWhite,
                ),
          ),
        ),
      ),
      child: child,
    );
  }
}
