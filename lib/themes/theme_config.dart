import 'package:flutter/material.dart';
export 'color_palettes.dart';
export 'text_styles.dart';
export 'button_style.dart';
export 'svg_icons.dart';
export 'divider_style.dart';
export 'indicator_style.dart';
export 'navigator_style.dart';
export '../widgets/form_fields/form_field_text.dart';
export '../utils/utils.dart';

class ThemeConfig {
  static ThemeData createTheme({
    Brightness? brightness,
  }) {
    return ThemeData(
      brightness: brightness,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.blue.withOpacity(0.8),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
      );
}
