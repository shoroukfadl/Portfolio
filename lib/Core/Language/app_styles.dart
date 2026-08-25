import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get baseFamily => GoogleFonts.spaceGrotesk();
  static TextStyle get secondaryFamily => GoogleFonts.inter();
  static TextStyle get thirdFamily => GoogleFonts.jetBrainsMono();
  static TextStyle get nameFamily => GoogleFonts.italianno();

  /// ---------------------------------- STYLES ----------------------------

  static TextStyle summaryTitle(
          {Color? color, required BuildContext context}) =>
      baseFamily.copyWith(
        fontSize: context.matchedSize(large: 48, medium: 32, small: 24),
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
      );

  static TextStyle sectionsTitle(
          {Color? color, required BuildContext context}) =>
      baseFamily.copyWith(
        fontSize: context.matchedSize(large: 20, medium: 16, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle sectionsSubTitle(
          {Color? color, required BuildContext context}) =>
      thirdFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 8),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle projectName({Color? color, required BuildContext context}) =>
      baseFamily.copyWith(
        fontSize: context.matchedSize(large: 14, medium: 12, small: 10),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle summarySubTitle(
          {Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        fontSize: context.matchedSize(large: 20, medium: 14, small: 12),
      );

  static TextStyle title({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle buttonLabel({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle buttonLabelS(
          {Color? color, required BuildContext context}) =>
      nameFamily.copyWith(
        fontSize: context.matchedSize(large: 16, medium: 10, small: 10),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        letterSpacing: 2,
        wordSpacing: 1.4,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle body({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 14, medium: 12, small: 10),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle cardBodyL({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 8),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle cardBody({Color? color, required BuildContext context}) =>
      thirdFamily.copyWith(
        fontSize: context.matchedSize(large: 10, medium: 8, small: 8),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle titleCardSmall(
          {Color? color, required BuildContext context}) =>
      thirdFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 8),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle titleCard({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 14, medium: 12, small: 10),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle titleCard2({Color? color, required BuildContext context}) =>
      baseFamily.copyWith(
        fontSize: context.matchedSize(large: 16, medium: 14, small: 12),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle tabTitle({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 10, medium: 8, small: 8),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle subtitleCard(
          {Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle location({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle label({Color? color, required BuildContext context}) =>
      thirdFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle titleSmall({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle summaryNumberLarge(
          {Color? color, required BuildContext context}) =>
      thirdFamily.copyWith(
        fontSize: context.matchedSize(large: 24, medium: 20, small: 20),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle summaryNumberMedium(
          {Color? color, required BuildContext context}) =>
      thirdFamily.copyWith(
        fontSize: context.matchedSize(large: 10, medium: 10, small: 8),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
}
