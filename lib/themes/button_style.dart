import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'theme_config.dart';

class ButtonStyle {
  static Widget rounded({
    required void Function()? onPressed,
    required Widget child,
    Color? color,
    Color? splashColor,
    double minHeight = 56,
    double maxHeight = double.infinity,
    double minWidth = 0,
    double maxWidth = double.infinity,
    BorderRadiusGeometry? borderRadius,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<BoxShadow>? boxShadow,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: boxShadow,
      ),
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: splashColor,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: [
            if (prefixIcon != null) prefixIcon,
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: child,
              ),
            ),
            if (suffixIcon != null) suffixIcon,
          ],
        ),
      ),
    );
  }

  static Widget outline({
    required void Function()? onPressed,
    required Widget child,
    Color? color,
    Color? splashColor,
    double? maxWidth,
    double? minWidth,
    double minHeight = 56,
    double? maxHeight,
    Color? borderColor,
    double borderWidth = 1,
    BorderRadiusGeometry? borderRadius,
    bool isEnable = true,
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? boxShadowHighlight,
    Color? highLightColor,
    int hightLightDuration = 50,
  }) {
    List<BoxShadow>? shadow = boxShadow;
    Color? buttonDefaultColor = isEnable ? color : SurfaceColors.med;
    Color? buttonColor = buttonDefaultColor;
    return StatefulBuilder(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          boxShadow: shadow,
        ),
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: splashColor,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? ColorPalettes.primary75,
                width: borderWidth,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(4),
            ),
          ),
          onPressed: isEnable
              ? () {
                  state(() {
                    if (boxShadowHighlight != null) {
                      shadow = boxShadowHighlight;
                    }
                    if (highLightColor != null) {
                      buttonColor = highLightColor;
                    }
                  });
                  Future.delayed(Duration(milliseconds: hightLightDuration),
                      () {
                    state(() {
                      buttonColor = buttonDefaultColor;
                      shadow = boxShadow;
                    });
                    Future.delayed(const Duration(milliseconds: 50), () {
                      if (onPressed != null) {
                        onPressed();
                      }
                    });
                  });
                }
              : null,
          child: child,
        ),
      );
    });
  }

  static Widget gradient({
    required void Function()? onPressed,
    required Widget child,
    Color? splashColor,
    double? width,
    double height = 56,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    Gradient? gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: border ?? Border.all(color: ColorPalettes.transparent),
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        gradient: gradient,
      ),
      constraints: BoxConstraints(
        maxWidth: width ?? double.infinity,
        minHeight: height,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: splashColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  static Widget backButton({
    required void Function()? onTap,
    required Widget child,
  }) {
    return Row(
      children: [
        InkWell(
          splashColor: ColorPalettes.transparent,
          highlightColor: ColorPalettes.transparent,
          onTap: onTap,
          child: ClipOval(
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                border: Border.all(color: OutlineColors.med),
                color: SurfaceColors.surfaceWhite,
                boxShadow: [
                  BoxShadowStyle.e01,
                ],
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgIcon(
                  SvgIcons.arrowBackward,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: child,
        ),
      ],
    );
  }

  static Widget googleButon({
    required void Function()? onPressed,
    required String title,
    double radius = 144,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorPalettes.primary75,
        ),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadowStyle.e01,
        ],
        color: ColorPalettes.primary25,
      ),
      constraints: const BoxConstraints(
        minHeight: 44,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: ColorPalettes.primary25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              SvgIcons.google,
              size: 24,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                title,
                style: CustomTextStyle.boldStandard(
                  color: TextColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget questionLink({
    required Widget question,
    required String link,
    required EdgeInsetsGeometry padding,
    required Function() onTap,
    Color? splashColor,
    Color? highlightColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        question,
        InkWell(
          splashColor: splashColor ?? ColorPalettes.g50,
          highlightColor: highlightColor ?? ColorPalettes.g50,
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Text(
              link,
              style: CustomTextStyle.underlineBody(
                color: ColorPalettes.info500,
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget dropdown<T>({
    Widget? hint,
    required List<Map<String, dynamic>> dataSource,
    T? value,
    Function(T?)? onChanged,
    double minWidth = 89,
    double maxWidth = 200,
    double minHeight = 40,
    double maxHeight = 40,
    BoxDecoration? dropdownDecoration,
    Color? selectedItemHighlightColor,
  }) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        value: value,
        customButton: Container(
          constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  dataSource
                      .where((e) => e['value'] == value)
                      .first['name']
                      .toString(),
                  style: CustomTextStyle.mediumSub(
                    color: TextColors.textHighEm,
                  ),
                ),
              ),
              SvgIcon(
                SvgIcons.arrowIosDownward,
                color: TextColors.iconHighEm,
                size: 18,
              ),
            ],
          ),
        ),
        hint: hint,
        selectedItemBuilder: (context) => dataSource.map((item) {
          final selected = item['value'] as T;
          return DropdownMenuItem<T>(
            value: selected,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    item['name'],
                    style: CustomTextStyle.mediumSub(
                      color: TextColors.textHighEm,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        items: dataSource.map((item) {
          final selected = item['value'] as T;
          final isSelected = selected == value;
          return DropdownMenuItem<T>(
            value: selected,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    item['name'],
                    style: CustomTextStyle.mediumSub(
                      color: TextColors.textHighEm,
                    ),
                  ),
                ),
                if (isSelected)
                  SvgIcon(
                    SvgIcons.checkCircle,
                    color: ColorPalettes.success500,
                    size: 24,
                  ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  static Widget roundLight({
    required void Function()? onPressed,
    required Widget child,
    Color? color,
    Color? splashColor,
    double? width,
    double height = 56,
    BorderRadiusGeometry? borderRadius,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isEnable = true,
  }) {
    Color buttonColor =
        isEnable ? color ?? ColorPalettes.primary500 : SurfaceColors.med;
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      constraints: BoxConstraints(
        maxWidth: width ?? double.infinity,
        minHeight: height,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: splashColor,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: child,
            ),
            if (suffixIcon != null) suffixIcon,
          ],
        ),
      ),
    );
  }

  static Widget roundDark({
    required void Function()? onPressed,
    required Widget child,
    Color? color,
    Color? splashColor,
    double minHeight = 56,
    double maxHeight = double.infinity,
    double minWidth = 0,
    double maxWidth = double.infinity,
    BorderRadiusGeometry? borderRadius,
    Widget? prefixIcon,
    Widget? suffixIcon,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    bool isEnable = true,
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? boxShadowHighlight,
    Color? highLightColor,
    int hightLightDuration = 50,
  }) {
    List<BoxShadow>? shadow = boxShadow;
    Color buttonDefaultColor =
        isEnable ? color ?? ColorPalettes.primary500 : SurfaceColors.med;
    Color buttonColor = buttonDefaultColor;
    return StatefulBuilder(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          boxShadow: shadow,
          color: buttonColor,
        ),
        constraints: BoxConstraints(
          minWidth: minWidth,
          maxWidth: maxWidth,
          minHeight: minHeight,
          maxHeight: maxHeight,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: splashColor,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
          ),
          onPressed: isEnable
              ? () {
                  state(() {
                    if (boxShadowHighlight != null) {
                      shadow = boxShadowHighlight;
                    }
                    if (highLightColor != null) {
                      buttonColor = highLightColor;
                    }
                  });
                  Future.delayed(Duration(milliseconds: hightLightDuration),
                      () {
                    state(() {
                      buttonColor = buttonDefaultColor;
                      shadow = boxShadow;
                    });
                    Future.delayed(const Duration(milliseconds: 50), () {
                      if (onPressed != null) {
                        onPressed();
                      }
                    });
                  });
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: mainAxisSize,
            children: [
              if (prefixIcon != null) prefixIcon,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: child,
              ),
              if (suffixIcon != null) suffixIcon,
            ],
          ),
        ),
      );
    });
  }

  static Widget buttonIcon(
    SvgIconData icon, {
    Color? backgroundColor,
    Color? borderColor,
    Color? iconColor,
    double iconSize = 18,
    double radius = 8,
    EdgeInsetsGeometry? iconPadding,
    required Function()? onTap,
    Widget? textWidget,
    bool textOnRight = true,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? boxShadowHighlight,
    Color? highLightColor,
    int hightLightDuration = 50,
  }) {
    List<BoxShadow>? shadow = boxShadow;
    Color buttonDefaultColor = backgroundColor ?? SurfaceColors.surfaceWhite;
    Color buttonColor = buttonDefaultColor;
    return StatefulBuilder(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(
            color: borderColor ?? OutlineColors.med,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadow,
        ),
        child: InkWell(
          onTap: () {
            state(() {
              if (boxShadowHighlight != null) {
                shadow = boxShadowHighlight;
              }
              if (highLightColor != null) {
                buttonColor = highLightColor;
              }
            });
            Future.delayed(Duration(milliseconds: hightLightDuration), () {
              state(() {
                buttonColor = buttonDefaultColor;
                shadow = boxShadow;
              });
              Future.delayed(const Duration(milliseconds: 50), () {
                if (onTap != null) {
                  onTap();
                }
              });
            });
          },
          child: Row(
            mainAxisSize: mainAxisSize,
            children: [
              if (!textOnRight && textWidget != null) textWidget,
              Padding(
                padding: iconPadding ?? const EdgeInsets.all(8),
                child: SvgIcon(
                  icon,
                  color: iconColor ?? TextColors.iconHighEm,
                  size: iconSize,
                ),
              ),
              if (textOnRight && textWidget != null) textWidget,
            ],
          ),
        ),
      );
    });
  }

  static Widget buttonNomarl({
    required Widget child,
    required Function()? onTap,
    EdgeInsetsGeometry? childPadding,
    Widget? prefixIcon,
    Widget? suffixIcon,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    double minHeight = 44,
    double maxHeight = double.infinity,
    double minWidth = 0,
    double maxWidth = double.infinity,
    Color? color,
    Color? highlightColor,
    Color? splashColor,
  }) {
    return Material(
      color: color ?? SurfaceColors.surfaceWhite,
      child: InkWell(
        splashColor: splashColor ?? ColorPalettes.g50,
        highlightColor: highlightColor ?? ColorPalettes.g50,
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight,
          ),
          child: Padding(
            padding: childPadding ?? const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: mainAxisSize,
              children: [
                if (prefixIcon != null) prefixIcon,
                child,
                if (suffixIcon != null) suffixIcon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
