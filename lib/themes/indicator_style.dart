import 'package:flutter/material.dart';
import 'package:sample_app/themes/theme_config.dart';

class IndicatorStyle extends StatelessWidget {
  final double size;
  final Color? color;
  const IndicatorStyle({
    super.key,
    this.size = 32,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          color: color ?? ColorPalettes.info500,
        ),
      ),
    );
  }
}
