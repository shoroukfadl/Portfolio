import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xFF131412),
    surface: Color(0xff1C1B18),
    surfaceElevated: Color(0xff242320),
    secondary: Color(0xff1B4332),
    accent: Color(0xff74C69D),
    accent2: Color(0xff52B788),
    accentSoft: Color(0xff1B4332),
    success: Color(0xFF05B367),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    text1: Color(0xFFF0EDE6),
    text2: Color(0xFFA8A49C),
    text3: Color(0xFF6A6660),
    secondaryEv: Color(0xff95D5B2),
  );

  // Shared
  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF34D399);
  static const Color error = Color(0xFFDC2626);
  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xFFF7F5F0),
    surface: Color(0xffEEEAE2),
    surfaceElevated: Color(0xffFFFFFF),
    secondary: Color(0xffE9F5EE),
    accent: Color(0xff2D6A4F),
    accent2: Color(0xff74C69D),
    accentSoft: Color(0xffD8F3DC),
    success: Color(0xFF05B367),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    text1: Color(0xff1C1C1A),
    text2: Color(0xff5A5955),
    text3: Color(0xff9A9892),
    secondaryEv: Color(0xff1B4332),
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color text3;
  final Color accent;
  final Color accent2;
  final Color accentSoft;
  final Color secondary;
  final Color secondaryEv;
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;

  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.text3,
    required this.accent,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.danger,
    required this.text1,
    required this.text2,
    required this.secondaryEv,
    required this.accent2,
    required this.accentSoft,
  });

  // ─── Gradient Helpers ─────────────────────────────────────────────────────

  /// Subtle card depth (dark theme only)
  static const gradientCardDark = LinearGradient(
    colors: [
      Color(0xFF131412),
      Color(0xff1C1B18),
      Color(0xff242320),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientCardLight = LinearGradient(
    colors: [
      Color(0xFFF7F5F0),
      Color(0xffEEEAE2),
      Color(0xffFFFFFF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ─── copyWith ─────────────────────────────────────────────────────────────
  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? border,
    Color? accent,
    Color? accentCyan,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? danger,
    Color? textPrimary,
    Color? textSecondary,
    Color? secondaryEv,
    Color? accent2,
    Color? accentSoft,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      text3: border ?? this.text3,
      accent: accent ?? this.accent,
      secondary: accentCyan ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: textPrimary ?? this.text1,
      text2: textSecondary ?? this.text2,
      secondaryEv: secondaryEv ?? this.secondaryEv,
      accent2: accent2 ?? this.accent2,
      accentSoft: accentSoft ?? this.accentSoft,
    );
  }

  // ─── lerp ─────────────────────────────────────────────────────────────────
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
      secondaryEv: Color.lerp(secondaryEv, other.secondaryEv, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      accent2: Color.lerp(accent2, other.accent2, t)!,
    );
  }
}
