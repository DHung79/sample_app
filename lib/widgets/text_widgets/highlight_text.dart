import 'package:flutter/material.dart';
import '../../themes/theme_config.dart';

class HighlightText extends StatefulWidget {
  final Color? backgroundColor;
  final String text;
  final TextStyle? textStyle;
  final String highlightText;
  final TextStyle? highlightStyle;
  final int? maxLines;
  final TextOverflow overflow;
  final bool highlightWithoutCase;
  final TextAlign textAlign;
  final bool isSelectable;
  const HighlightText({
    super.key,
    this.backgroundColor,
    required this.text,
    required this.textStyle,
    required this.highlightText,
    this.highlightStyle,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.highlightWithoutCase = true,
    this.textAlign = TextAlign.start,
    this.isSelectable = false,
  });

  @override
  State<HighlightText> createState() => _HighlightTextState();
}

class _HighlightTextState extends State<HighlightText> {
  @override
  Widget build(BuildContext context) {
    return widget.isSelectable
        ? SelectableText.rich(
            maxLines: widget.maxLines,
            textAlign: widget.textAlign,
            TextSpan(
              children: highlightText(
                source: widget.text,
                highlightStyle: widget.highlightStyle ??
                    CustomTextStyle.regularSub(color: ColorPalettes.g800),
                highlightWithoutCase: widget.highlightWithoutCase,
              ),
              style: widget.textStyle ??
                  CustomTextStyle.regularSub(color: ColorPalettes.g600),
            ),
          )
        : RichText(
            maxLines: widget.maxLines,
            overflow: widget.overflow,
            textAlign: widget.textAlign,
            text: TextSpan(
              children: highlightText(
                source: widget.text,
                highlightStyle: widget.highlightStyle ??
                    CustomTextStyle.regularSub(color: ColorPalettes.g800),
                highlightWithoutCase: widget.highlightWithoutCase,
              ),
              style: widget.textStyle ??
                  CustomTextStyle.regularSub(color: ColorPalettes.g600),
            ),
          );
  }

  List<TextSpan> highlightText({
    required String source,
    TextStyle? highlightStyle,
    required bool highlightWithoutCase,
  }) {
    if (widget.highlightText.isEmpty ||
        !source.toLowerCase().contains(widget.highlightText.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = highlightWithoutCase
        ? widget.highlightText.toLowerCase().allMatches(source.toLowerCase())
        : widget.highlightText.allMatches(source);

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: highlightStyle?.copyWith(
          backgroundColor: widget.backgroundColor ?? ColorPalettes.oYellow1,
        ),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(
          TextSpan(
            text: source.substring(match.end, source.length),
          ),
        );
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}

class JTHighlightTexts extends StatefulWidget {
  final Color? backgroundColor;
  final String text;
  final TextStyle? textStyle;
  final List<String> highlightTexts;
  final TextStyle? highlightStyle;
  final int? maxLines;
  final TextOverflow overflow;
  final bool highlightWithoutCase;
  final TextAlign textAlign;
  const JTHighlightTexts({
    super.key,
    this.backgroundColor,
    required this.text,
    required this.textStyle,
    required this.highlightTexts,
    this.highlightStyle,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.highlightWithoutCase = true,
    this.textAlign = TextAlign.start,
  });

  @override
  State<JTHighlightTexts> createState() => _JTHighlightTextsState();
}

class _JTHighlightTextsState extends State<JTHighlightTexts> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
      text: TextSpan(
        children: highlightTexts(
          source: widget.text,
          highlightStyle: widget.highlightStyle ??
              CustomTextStyle.regularSub(color: ColorPalettes.g800),
          highlightWithoutCase: widget.highlightWithoutCase,
        ),
        style:
            widget.textStyle ?? CustomTextStyle.regularSub(color: ColorPalettes.g600),
      ),
    );
  }

  List<TextSpan> highlightTexts({
    required String source,
    TextStyle? highlightStyle,
    required bool highlightWithoutCase,
  }) {
    if (widget.highlightTexts.isEmpty) {
      return [TextSpan(text: source)];
    } else {
      final List<TextSpan> children = [];
      final List<String> texts = [];
      for (var highlightText in widget.highlightTexts) {
        if (!source.toLowerCase().contains(highlightText.toLowerCase())) {
          return [TextSpan(text: source)];
        } else {
          final matches = highlightWithoutCase
              ? highlightText.toLowerCase().allMatches(source.toLowerCase())
              : highlightText.allMatches(source);
          int lastMatchEnd = 0;
          for (var i = 0; i < matches.length; i++) {
            final match = matches.elementAt(i);
            if (match.start != lastMatchEnd) {
              if (texts.isNotEmpty) {
                final textsQuery =
                    texts.where((e) => e.contains(highlightText.toLowerCase()));
                if (textsQuery.isNotEmpty) {
                  final highlightIndex =
                      textsQuery.first.indexOf(highlightText.toLowerCase());
                  final textsIndex = texts.indexOf(textsQuery.first);
                  texts[textsIndex] = textsQuery.first.substring(
                    0,
                    highlightIndex,
                  );
                } else {
                  texts.add(
                    source.substring(lastMatchEnd, match.start),
                  );
                }
              }
            }
            texts.add(
              source.substring(match.start, match.end),
            );
            if (i == matches.length - 1 && match.end != source.length) {
              if (texts.isNotEmpty) {
                final textsQuery = texts.where((e) =>
                    e.length > highlightText.length &&
                    e.contains(highlightText.toLowerCase()));
                if (textsQuery.isNotEmpty) {
                  final highlightIndex =
                      textsQuery.first.indexOf(highlightText.toLowerCase());
                  final textsIndex = texts.indexOf(textsQuery.first);
                  texts[textsIndex] = textsQuery.first.substring(
                    highlightIndex,
                    highlightIndex + highlightText.length,
                  );
                } else {
                  texts.add(
                    source.substring(match.end, source.length),
                  );
                }
              }
            }
            lastMatchEnd = match.end;
          }
        }
      }
      for (var text in texts) {
        if (widget.highlightTexts
            .where((e) => e.toLowerCase() == text.toLowerCase())
            .isNotEmpty) {
          children.add(
            TextSpan(
              text: text,
              style: highlightStyle?.copyWith(
                backgroundColor: widget.backgroundColor ?? ColorPalettes.oYellow1,
              ),
            ),
          );
        } else {
          children.add(
            TextSpan(
              text: text,
            ),
          );
        }
      }
      return children;
    }
  }
}
