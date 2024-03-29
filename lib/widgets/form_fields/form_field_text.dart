import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../text_widgets/highlight_text.dart';
import '../../themes/theme_config.dart';

class FormFieldText extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool obscureText;
  final Function()? passwordIconOnPressed;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIconWidget;
  final SvgIconData? prefixIcon;
  final Color? prefixIconColor;
  final Color? prefixIconFocusColor;
  final bool isUnderLineBorder;
  final bool disableError;
  final bool readOnly;
  final EdgeInsetsGeometry prefixIconPadding;
  final TextStyle? style;
  final int? minLines;
  final int maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool hasValidate;
  final Widget? validateIcon;
  final FocusNode? focusNode;
  final EdgeInsets scrollPadding;
  final bool? enabled;
  final bool showCounter;
  final bool autofocus;
  const FormFieldText({
    super.key,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.obscureText = false,
    this.passwordIconOnPressed,
    this.hintText,
    this.hintStyle,
    this.prefixIconWidget,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconFocusColor,
    this.isUnderLineBorder = false,
    this.disableError = false,
    this.readOnly = false,
    this.prefixIconPadding = const EdgeInsets.fromLTRB(10, 10, 20, 10),
    this.style,
    this.minLines,
    this.maxLines = 1,
    this.contentPadding,
    this.fillColor,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.maxLength,
    this.hasValidate = false,
    this.validateIcon,
    this.focusNode,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enabled,
    this.showCounter = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      enabled: enabled,
      scrollPadding: scrollPadding,
      focusNode: focusNode,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      style: style ??
          CustomTextStyle.mediumBody(
            color: TextColors.textHighEm,
          ),
      decoration: InputDecoration(
        isDense: true,
        counterText: showCounter ? null : '',
        contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(0, 0, 4, 0),
        prefixIcon: prefixIconWidget ??
            (prefixIcon != null
                ? Padding(
                    padding: prefixIconPadding,
                    child: hasValidate
                        ? validateIcon ??
                            SvgIcon(
                              SvgIcons.warningOutline,
                              color: ColorPalettes.error500,
                              size: 24,
                            )
                        : SvgIcon(
                            prefixIcon,
                            color: TextColors.textHighEm,
                            size: 24,
                          ),
                  )
                : null),
        suffixIcon: isPassword
            ? ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: CustomButtonStyle.buttonNomarl(
                    childPadding: EdgeInsets.zero,
                    mainAxisSize: MainAxisSize.min,
                    onTap: passwordIconOnPressed,
                    child: obscureText
                        ? SvgIcon(
                            SvgIcons.eye,
                            // color: ColorPalettes.g700,
                          )
                        : SvgIcon(
                            SvgIcons.eyeOff,
                            // color: ColorPalettes.g700,
                          ),
                  ),
                ),
              )
            : suffixIcon,
        filled: true,
        fillColor: fillColor ?? SurfaceColors.surfaceWhite,
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
        hintText: hintText,
        hintStyle: hintStyle ??
            CustomTextStyle.mediumBody(
              color: TextColors.textLowEm,
            ),
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
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
    super.key,
    required this.header,
    required this.child,
    this.textStyle,
    this.highlightStyle,
  });

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
