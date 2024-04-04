import 'package:flutter/material.dart';
import '../../themes/theme_config.dart';

class ButtonIcon extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final Widget? child;
  final Function()? onTap;
  final double radius;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;
  final Duration? duration;
  const ButtonIcon({
    super.key,
    this.child,
    this.onTap,
    this.radius = 10,
    this.color,
    this.borderColor,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor ?? ColorPalettes.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: boxShadow,
          shape: shape,
        ),
        child: child,
      ),
    );
  }
}
