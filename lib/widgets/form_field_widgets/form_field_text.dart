import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/theme_config.dart';
import '../text_widgets/highlight_text.dart';

class FormFieldText extends StatelessWidget {
  final bool? enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final bool autofocus;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final EdgeInsets scrollPadding;
  final TextStyle? style;
  final Color? fillColor;
  final String? counterText;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool isUnderLineBorder;
  final bool disableError;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const FormFieldText({
    Key? key,
    this.enabled,
    this.readOnly = false,
    this.focusNode,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.obscureText = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.style,
    this.fillColor,
    this.counterText,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.isUnderLineBorder = false,
    this.disableError = false,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autofocus,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      obscureText: obscureText,
      scrollPadding: scrollPadding,
      style: style ??
          CustomTextStyle.mediumBody(
            color: TextColors.textHighEm,
          ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: fillColor ?? SurfaceColors.surfaceWhite,
        counterText: counterText,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            CustomTextStyle.mediumBody(
              color: TextColors.textLowEm,
            ),
        enabledBorder: buttonBorder(
          isUnderLine: isUnderLineBorder,
          color: OutlineColors.med,
        ),
        border: buttonBorder(
          isUnderLine: isUnderLineBorder,
          color: OutlineColors.med,
        ),
        focusedBorder: buttonBorder(
          isUnderLine: isUnderLineBorder,
          color: OutlineColors.primary,
          shadow: BoxShadowStyle.primary,
        ),
        errorBorder: buttonBorder(
          isUnderLine: isUnderLineBorder,
          color: OutlineColors.errorHigh,
          shadow: BoxShadowStyle.error,
        ),
        focusedErrorBorder: buttonBorder(
          isUnderLine: isUnderLineBorder,
          color: OutlineColors.errorHigh,
          shadow: BoxShadowStyle.error,
        ),
        errorStyle: disableError
            ? const TextStyle(fontSize: 0)
            : CustomTextStyle.mediumSub(
                color: ColorPalettes.error500,
              ),
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  InputBorder buttonBorder({
    bool isUnderLine = false,
    required Color color,
    double radius = 8,
    double? underlineWidth,
    double? outlineWidth,
    List<BoxShadow>? shadow,
  }) {
    return DecoratedInputBorder(
      shadow: shadow ??
          [
            BoxShadowStyle.e01,
          ],
      child: isUnderLine
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                width: underlineWidth ?? 3.0,
                color: color,
              ),
              borderRadius: BorderRadius.circular(radius),
            )
          : OutlineInputBorder(
              borderSide: BorderSide(
                width: outlineWidth ?? 1,
                color: color,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
    );
  }
}

class JTInputWithHeader extends StatelessWidget {
  final String header;
  final Widget child;
  final TextStyle? textStyle;
  final TextStyle? highlightStyle;
  const JTInputWithHeader({
    Key? key,
    required this.header,
    required this.child,
    this.textStyle,
    this.highlightStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 6),
          child: HighlightText(
            backgroundColor: ColorPalettes.transparent,
            text: header,
            textStyle: textStyle ??
                CustomTextStyle.mediumBody(color: TextColors.textMedEm),
            highlightText: '(*)',
            highlightStyle: highlightStyle ??
                CustomTextStyle.mediumBody(color: ColorPalettes.error500),
          ),
        ),
        child,
      ],
    );
  }
}
