import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get baseFamily => GoogleFonts.ptSerif();
  static TextStyle get secondaryFamily => GoogleFonts.inter();

  /// -------------------------------- Basic Function -----------------------------------------
  static TextStyle baseStyle(
          {required double size,
          required FontWeight fontWeight,
          Color? color}) =>
      baseFamily.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      );

  static TextStyle secondaryStyle(
          {required double size,
          required FontWeight fontWeight,
          Color? color}) =>
      secondaryFamily.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      );

  /// ---------------------------------- STYLES ----------------------------

  static TextStyle h1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 52, medium: 40, small: 32),
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle h2({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 32, medium: 24, small: 20),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle h3({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 24, medium: 20, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle h4({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 10, small: 10),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle h5({Color? color, required BuildContext context}) =>
      baseStyle(
        size: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle hc1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 14, medium: 13, small: 12),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle hc2({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 16, medium: 16, small: 12),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle hc3({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 14, medium: 10, small: 8),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle t1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 10, medium: 9, small: 9),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle hsub1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 20, medium: 16, small: 14),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  static TextStyle hSsub1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        size: context.matchedSize(large: 20, medium: 14, small: 12),
      );

  static TextStyle hsub2({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 14, medium: 10, small: 8),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle hsub3({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle n1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 14, medium: 12, small: 10),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  static TextStyle bl1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 11, small: 10),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle b1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 14, medium: 13, small: 12),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle bc1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 10, small: 9),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle bc2({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 11, medium: 10, small: 10),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle l1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: !context.isSmall ? 12 : 10,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  static TextStyle l2({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );
  static TextStyle l3({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 10, medium: 10, small: 9),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );
}
