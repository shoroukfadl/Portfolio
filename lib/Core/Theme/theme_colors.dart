import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xFF0F172A),
    surface: Color(0xFF0F1629),
    surfaceElevated: Color(0xFF1A2340),
    border: Color(0xFFC8D3EF),
    accent: Color(0xFF274c77),
    secondary: Color(0xFF8b8c89),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    fontColor1: Color(0xFF0B2950),
    fontColor2: Color(0xFF303C50),
    accent50: Color(0xFF6096ba),
    accent25: Color(0xFFa3cef1),
    fontColor3: Color(0xffbcbcbc),
  );

  // Shared
  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF34D399);
  static const Color error = Color(0xFFDC2626);
  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xFFe7ecef),
    surface: Color(0xfff0f2f4),
    surfaceElevated: Color(0xFFEDF1FB),
    border: Color(0xFF0B2950),
    accent: Color(0xFF274c77),
    secondary: Color(0xFF8b8c89),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    fontColor1: Color(0xFF0B2950),
    fontColor2: Color(0xFF303C50),
    accent50: Color(0xFF6096ba),
    accent25: Color(0xFFa3cef1),
    fontColor3: Color(0xffbcbcbc),
    // Slate
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;
  final Color accent;
  final Color accent50;
  final Color accent25;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color danger;
  final Color fontColor1;
  final Color fontColor2;
  final Color fontColor3;

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
    required this.fontColor1,
    required this.fontColor2,
    required this.accent50,
    required this.accent25,
    required this.fontColor3,
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
      Color(0xFF050812),
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
    Color? secondary,
    Color? success,
    Color? warning,
    Color? danger,
    Color? textPrimary,
    Color? accent50,
    Color? fontColor3,
    Color? textSecondary,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      fontColor1: textPrimary ?? this.fontColor1,
      fontColor2: textSecondary ?? this.fontColor2,
      accent25: accent25??this.accent25,
      accent50:accent50??this.accent50,
      fontColor3:fontColor3??this.fontColor3,
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
      fontColor1: Color.lerp(fontColor1, other.fontColor1, t)!,
      fontColor2: Color.lerp(fontColor2, other.fontColor2, t)!,
      accent50: Color.lerp(accent50, other.accent50, t)!,
      fontColor3: Color.lerp(fontColor3, other.fontColor3, t)!,
      accent25: Color.lerp(accent25, other.accent25, t)!
    );
  }
}
