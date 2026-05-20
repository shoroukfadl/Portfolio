import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xff021437),
    surfaceElevated: Color(0xff020f29),
    surface: Color(0xff121f39),
    border: Color(0xffb2c2d2),
    secondary: Color(0xff8CA4BB),
    accent: Color(0xff516E89),
    success: Color(0xFF05B367),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    textPrimary: Color(0xffd2e1f1),
    textSecondary: Color(0xffe3d8d8),
    secondaryEv: Color(0xffc2121f),

  );

  // Shared
  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF34D399);
  static const Color error = Color(0xFFDC2626);
  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xfffdfcfc),
    surface: Color(0xffe4d8c0),
    surfaceElevated: Color(0xffe6e1d7),
    border: Color(0xff011825),
    secondary: Color(0xff780000),
    accent: Color(0xff003049),
    success: Color(0xFF05B367),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    textPrimary: Color(0xff011825),
    textSecondary: Color(0xff669BBC),
    secondaryEv: Color(0xffc2121f),
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;
  final Color accent;
  final Color secondary;
  final Color secondaryEv;
  final Color success;
  final Color warning;
  final Color danger;
  final Color textPrimary;
  final Color textSecondary;

  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.border,
    required this.accent,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.danger,
    required this.textPrimary,
    required this.textSecondary, required this.secondaryEv,
  });

  // ─── Gradient Helpers ─────────────────────────────────────────────────────


  /// Subtle card depth (dark theme only)
  static const gradientCardDark = LinearGradient(
    colors: [
      Color(0xff021437),
      Color(0xFF1a1f3a),
      Color(0xFF0a0e27),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientCardLight = LinearGradient(
    colors: [
      Color(0xfffdfcfc),
      Color(0xffe6e1d7),
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
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      secondary: accentCyan ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      secondaryEv: secondaryEv??this.secondaryEv,
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
      border: Color.lerp(border, other.border, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      secondaryEv: Color.lerp(secondaryEv, other.secondaryEv, t)!,
    );
  }
}
