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
  );

  // Shared
  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF34D399);
  static const Color error = Color(0xFFDC2626);
  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xffF5F5F5),
    surfaceElevated: Color(0xffD9E1E9),
    surface: Color(0xffB2C2D2),
    border: Color(0xffb2c2d2),
    secondary: Color(0xff8CA4BB),
    accent: Color(0xff516E89),
    success: Color(0xFF05B367),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    textPrimary: Color(0xff092745),
    textSecondary: Color(0xff6A89A7),
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;
  final Color accent;
  final Color secondary;
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
    required this.textSecondary,
  });

  // ─── Gradient Helpers ─────────────────────────────────────────────────────

  /// Flutter Blue → Dart Purple  (hero banners, CTAs)
  static const gradientHero = LinearGradient(
    colors: [Color(0xFF027DFD), Color(0xFF7C4DFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Electric Cyan → Flutter Blue  (glow effects, highlights)
  static const gradientGlow = LinearGradient(
    colors: [Color(0xFF00D4FF), Color(0xFF027DFD)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
      Color(0xFFF6F5F5),
      Color(0xFFEDF1FB),
      Color(0xFFEDF1FB),
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
    );
  }
}
