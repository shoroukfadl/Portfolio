import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get mainFamily => GoogleFonts.spaceGrotesk();

  static TextStyle get secondaryFamily => GoogleFonts.inter();

  static TextStyle extraBold48({Color? color}) => mainFamily.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        color: color ?? Colors.black,
      );

  static TextStyle extraBoldM48({Color? color}) => secondaryFamily.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        color: color ?? Colors.black,
      );

  static TextStyle extraBold40({Color? color}) => mainFamily.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
      );

  static TextStyle extraBold32({Color? color}) => mainFamily.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
      );

  static TextStyle extraBold16({Color? color}) => mainFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle extraBold18({Color? color}) => mainFamily.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle extraBold24({Color? color}) => mainFamily.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle extraBold20({Color? color}) => mainFamily.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle extraBold14({Color? color}) => mainFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle semiBold28({Color? color}) => mainFamily.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.2,
        letterSpacing: -0.5,
      );

  static TextStyle semiBold24({Color? color}) => mainFamily.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.25,
        letterSpacing: -0.3,
      );

  static TextStyle semiBold20({Color? color}) => mainFamily.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.3,
        letterSpacing: -0.2,
      );

  static TextStyle semiBold18({Color? color}) => mainFamily.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.35,
        letterSpacing: -0.1,
      );

  static TextStyle semiBold16({Color? color}) => mainFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle semiBold14({Color? color}) => mainFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle semiBold12({Color? color}) => mainFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  /// 18px · w400 — Long-form reading body
  static TextStyle regular18({Color? color}) => secondaryFamily.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  /// 16px · w400 — Standard body / descriptions
  static TextStyle regular16({Color? color}) => secondaryFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.65,
        letterSpacing: 0.1,
      );

  /// 14px · w400 — Secondary body / card descriptions
  static TextStyle regular14({Color? color}) => secondaryFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.6,
        letterSpacing: 0.1,
      );

  /// 12px · w400 — Captions, helper text
  static TextStyle regular12({Color? color}) => secondaryFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
        letterSpacing: 0.2,
      );

  /// 10px · w400 — Fine print, timestamps, micro-labels
  static TextStyle regular10({Color? color}) => secondaryFamily.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
        letterSpacing: 0.3,
      );

  // =========================================================================
  // UI LABELS  — IBM Plex Sans Medium  (buttons, chips, nav, badges)
  // =========================================================================

  /// 16px · w500 — Button / primary action label
  static TextStyle medium28({Color? color}) => secondaryFamily.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  static TextStyle medium20({Color? color}) => secondaryFamily.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  static TextStyle medium24({Color? color}) => secondaryFamily.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  static TextStyle medium16({Color? color}) => secondaryFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  /// 14px · w500 — Chip / tab / secondary button label
  static TextStyle medium14({Color? color}) => secondaryFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  /// 12px · w500 — Badge / tag / small chip label
  static TextStyle medium12({Color? color}) => secondaryFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.4,
      );

  /// 10px · w500 · UPPERCASE — Overline / category tag
  static TextStyle medium10({Color? color}) => secondaryFamily.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 1.5,
        textBaseline: TextBaseline.alphabetic,
      );

  /// ---------------------------------- STYLES ----------------------------

  static TextStyle summaryTitle(
          {Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge
            ? 40
            : context.isMedium
                ? 32
                : 24,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
      );

  static TextStyle summarySubTitle(
          {Color? color, required BuildContext context}) =>
      mainFamily.copyWith(
        fontSize: context.isLarge
            ? 20
            : context.isMedium
                ? 14
                : 12,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
      );

  static TextStyle title({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle buttonLabel({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle body({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle cardBody({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge ? 10 : 8,
        fontWeight: FontWeight.w300,
        color: color ?? Colors.black,
      );

  static TextStyle titleCardSmall(
          {Color? color, required BuildContext context}) =>
      mainFamily.copyWith(
        fontSize: context.isLarge
            ? 10
            : context.isMedium
                ? 10
                : 8,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle titleCard({Color? color, required BuildContext context}) =>
      mainFamily.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle subtitleCard(
          {Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle label({Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle titleSmall({Color? color, required BuildContext context}) =>
      mainFamily.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle sectionsTitle(
          {Color? color, required BuildContext context}) =>
      mainFamily.copyWith(
        fontSize: context.isLarge
            ? 14
            : context.isMedium
                ? 12
                : 10,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle summaryNumberLarge(
          {Color? color, required BuildContext context}) =>
      mainFamily.copyWith(
        fontSize: context.isLarge ? 24 : 18,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle summaryNumberMedium(
          {Color? color, required BuildContext context}) =>
      secondaryFamily.copyWith(
        fontSize: context.isLarge
            ? 12
            : context.isMedium
                ? 10
                : 8,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
}
