import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────

  // static TextStyle get _ibmPlexSans => GoogleFonts.syne();
  // static TextStyle get _ibmPlexSans => GoogleFonts.dmSans();
  static TextStyle get _ibmPlexSans => GoogleFonts.poppins();

  // static TextStyle get _jetBrainsMono => GoogleFonts.jetBrainsMono();

  // =========================================================================
  // DISPLAY  — Syne  (hero sections, name, big statements)
  // =========================================================================

  /// 72px · w800 — Full-page hero title
  static TextStyle displayXL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: -2.5,
      );

  /// 56px · w800 — Section hero / splash headline
  static TextStyle displayL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 56,
        fontWeight: FontWeight.w800,
        color: color ?? Colors.black,
        height: 1.05,
        letterSpacing: -2.0,
      );

  /// 40px · w700 — Sub-hero / feature title
  static TextStyle displayM({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.1,
        letterSpacing: -1.5,
      );

  /// 32px · w700 — Large card headline
  static TextStyle displayS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  static TextStyle displayXS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
        height: 1.15,
        letterSpacing: -1.0,
      );

  // =========================================================================
  // HEADINGS  — DM Sans  (section titles, card headers, nav items)
  // =========================================================================

  /// 28px · w600 — Page section title
  static TextStyle headingXL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.2,
        letterSpacing: -0.5,
      );

  /// 24px · w600 — Card / panel title
  static TextStyle headingL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.25,
        letterSpacing: -0.3,
      );

  /// 20px · w600 — Sub-section title
  static TextStyle headingM({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.3,
        letterSpacing: -0.2,
      );

  /// 18px · w500 — Widget / tile title
  static TextStyle headingS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.35,
        letterSpacing: -0.1,
      );

  /// 16px · w500 — Small heading / label group
  static TextStyle headingXS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  // =========================================================================
  // BODY  — IBM Plex Sans  (paragraphs, descriptions, UI text)
  // =========================================================================

  /// 18px · w400 — Long-form reading body
  static TextStyle bodyXL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.7,
        letterSpacing: 0.1,
      );

  /// 16px · w400 — Standard body / descriptions
  static TextStyle bodyL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.65,
        letterSpacing: 0.1,
      );

  /// 14px · w400 — Secondary body / card descriptions
  static TextStyle bodyM({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.6,
        letterSpacing: 0.1,
      );

  /// 12px · w400 — Captions, helper text
  static TextStyle bodyS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
        letterSpacing: 0.2,
      );

  /// 10px · w400 — Fine print, timestamps, micro-labels
  static TextStyle bodyXS({Color? color}) => _ibmPlexSans.copyWith(
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
  static TextStyle labelL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  /// 14px · w500 — Chip / tab / secondary button label
  static TextStyle labelM({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.3,
      );

  /// 12px · w500 — Badge / tag / small chip label
  static TextStyle labelS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 0.4,
      );

  /// 10px · w500 · UPPERCASE — Overline / category tag
  static TextStyle overline({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        height: 1.0,
        letterSpacing: 1.5,
        textBaseline: TextBaseline.alphabetic,
      );

  // =========================================================================
  // CODE  — JetBrains Mono  (code blocks, tech stack badges, terminal)
  // =========================================================================

  /// 16px · w400 — Code block / snippet
  static TextStyle codeL({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.7,
        letterSpacing: 0.0,
      );

  /// 14px · w400 — Inline code / tech badge
  static TextStyle codeM({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.6,
        letterSpacing: 0.0,
      );

  /// 12px · w400 — Small code annotation / version number
  static TextStyle codeS({Color? color}) => _ibmPlexSans.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
        letterSpacing: 0.0,
      );
}
