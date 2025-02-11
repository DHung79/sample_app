import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GGTextStyle {
  static TextStyle h5Bold({Color color = Colors.black, double? height}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 28,
      height: height,
    );
  }

  static TextStyle h2Bold({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 24,
    );
  }

  static TextStyle h2Medium({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 24,
    );
  }

  static TextStyle h3Bold({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 20,
    );
  }

  static TextStyle h4Bold({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 18,
    );
  }

  static TextStyle h4Medium({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 18,
    );
  }

  static TextStyle titleBold({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 18,
    );
  }

  static TextStyle standardBold({Color color = Colors.black, double? height}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 16,
      height: height,
    );
  }

  static TextStyle standardMedium({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 16,
      height: height,
    );
  }

  static TextStyle standardNormal({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 16,
      height: height,
    );
  }

  static TextStyle bodyBold({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 14,
      height: height,
    );
  }

  static TextStyle bodyMedium({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
      height: height,
    );
  }

  static TextStyle bodyNormal({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      height: 24 / 14,
    );
  }

  static TextStyle bodyItalic({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle subBold({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle subMedium({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 12,
      height: height,
    );
  }

  static TextStyle subNormal({
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle tinyMedium({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 10,
    );
  }

  static TextStyle underline({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle link({Color color = Colors.black, double? height}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
      decoration: TextDecoration.underline,
      height: height,
    );
  }

  static TextStyle headline4({Color color = Colors.black}) {
    return GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 34,
    );
  }

  static TextStyle body1({Color color = Colors.black}) {
    return GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle subtitle2({Color color = Colors.black}) {
    return GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle overline({Color color = Colors.black}) {
    return GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 10,
    );
  }

  static TextStyle headerTitle({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle mediumHeaderTitle({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle normalHeaderTitle({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 16,
    );
  }

  static TextStyle mediumBodyText({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle normalText({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle superscript({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      fontFeatures: const <FontFeature>[
        FontFeature.enable('sups'),
      ],
    );
  }

  static TextStyle superSmallText({Color color = Colors.black}) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 10,
    );
  }
}

class CustomTextStyle {
  static TextStyle regularH1({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 64,
      height: 72 / 64,
    );
  }

  static TextStyle mediumH1({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 64,
      height: 72 / 64,
    );
  }

  static TextStyle boldH1({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 64,
      height: 72 / 64,
    );
  }

  static TextStyle regularH2({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 52,
      height: 64 / 52,
    );
  }

  static TextStyle mediumH2({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 52,
      height: 64 / 52,
    );
  }

  static TextStyle boldH2({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 52,
      height: 64 / 52,
    );
  }

  static TextStyle regularH3({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 44,
      height: 64 / 44,
    );
  }

  static TextStyle mediumH3({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 44,
      height: 64 / 44,
    );
  }

  static TextStyle boldH3({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 44,
      height: 64 / 44,
    );
  }

  static TextStyle regularH4({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 32,
      height: 40 / 32,
    );
  }

  static TextStyle mediumH4({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 32,
      height: 40 / 32,
    );
  }

  static TextStyle boldH4({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 32,
      height: 40 / 32,
    );
  }

  static TextStyle regularH5({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 28,
      height: 40 / 28,
    );
  }

  static TextStyle mediumH5({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 28,
      height: 40 / 28,
    );
  }

  static TextStyle boldH5({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 28,
      height: 40 / 28,
    );
  }

  static TextStyle regularH6({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 22,
      height: 32 / 22,
    );
  }

  static TextStyle mediumH6({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 22,
      height: 32 / 22,
    );
  }

  static TextStyle boldH6({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 22,
      height: 32 / 22,
    );
  }

  static TextStyle semiBoldH6({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 22,
      height: 32 / 22,
    );
  }

  static TextStyle regularTitle({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 18,
      height: 24 / 18,
    );
  }

  static TextStyle normalTitle({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 18,
      height: 24 / 18,
    );
  }

  static TextStyle mediumTitle({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 18,
      height: 24 / 18,
    );
  }

  static TextStyle boldTitle({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 18,
      height: 24 / 18,
    );
  }

  static TextStyle regularStandard({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 16,
      height: 24 / 16,
    );
  }

  static TextStyle normalStandard({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 16,
      height: 24 / 16,
    );
  }

  static TextStyle mediumStandard({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 16,
      height: 24 / 16,
    );
  }

  static TextStyle boldStandard({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 16,
      height: 24 / 16,
    );
  }

  static TextStyle semiBoldStandard({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 16,
      height: 24 / 16,
    );
  }

  static TextStyle regularBody({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      height: 24 / 14,
    );
  }

  static TextStyle mediumBody({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 14,
      height: 24 / 14,
    );
  }

  static TextStyle boldBody({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 14,
      height: 24 / 14,
    );
  }

  static TextStyle boldSemiBody({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 14,
      height: 24 / 14,
    );
  }

  static TextStyle italicBody({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 14,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle underlineBody({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 24 / 14,
      color: Colors.transparent,
      shadows: [
        Shadow(
          offset: const Offset(0, -1),
          color: color,
        )
      ],
      decoration: TextDecoration.underline,
      decorationColor: color,
      decorationThickness: 1,
    );
  }

  static TextStyle regularSub({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 12,
      height: 16 / 12,
    );
  }

  static TextStyle mediumSub({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 12,
      height: 16 / 12,
    );
  }

  static TextStyle boldSub({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 12,
      height: 16 / 12,
    );
  }

  static TextStyle underlineSub({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: Colors.transparent,
      fontSize: 12,
      height: 16 / 12,
      shadows: [
        Shadow(
          offset: const Offset(0, -1),
          color: color,
        )
      ],
      decoration: TextDecoration.underline,
      decorationColor: color,
      decorationThickness: 1,
    );
  }

  static TextStyle lineThroughSub({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 12,
      height: 16 / 12,
      decoration: TextDecoration.lineThrough,
    );
  }

  static TextStyle regularTiny({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: 10,
      height: 16 / 10,
    );
  }

  static TextStyle mediumTiny({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: 10,
      height: 16 / 10,
    );
  }

  static TextStyle boldTiny({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: 10,
      height: 16 / 10,
    );
  }

  static TextStyle underline({Color color = Colors.black}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.transparent,
      shadows: [
        Shadow(
          offset: const Offset(0, -1),
          color: color,
        )
      ],
      decoration: TextDecoration.underline,
      decorationColor: color,
      decorationThickness: 1,
    );
  }

  static TextStyle link({Color color = Colors.black, double? height}) {
    return TextStyle(
      fontFamily: 'SVN-Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: height,
      color: Colors.transparent,
      shadows: [
        Shadow(
          offset: const Offset(0, -1),
          color: color,
        )
      ],
      decoration: TextDecoration.underline,
      decorationColor: color,
      decorationThickness: 1,
    );
  }
}
