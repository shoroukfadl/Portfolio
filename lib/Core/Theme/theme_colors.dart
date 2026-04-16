import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xFF0A0E17),
    // Void Black
    surface: Color(0xFF0F1629),
    // Deep Navy
    surfaceElevated: Color(0xFF1A2340),
    // Slate Blue
    border: Color(0xFF2A3555),
    // Steel
    accent: Color(0xFF027DFD),
    // Flutter Blue
    accentCyan: Color(0xFF00D4FF),
    // Electric Cyan
    accentPurple: Color(0xFF7C4DFF),
    // Dart Purple
    success: Color(0xFF00E5A0),
    // Mint
    warning: Color(0xFFFFB300),
    // Amber
    danger: Color(0xFFFF4757),
    // Coral Red
    textPrimary: Color(0xFFE8EDF8),
    // Cloud White
    textSecondary: Color(0xFF7A8BB0),
    // Steel Grey
    textMuted: Color(0xFF3D4F72),
    // Fog
    textOnAccent: Color(0xFFFFFFFF), // Pure White (text on colored buttons)
  );

  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xFFF5F8FF),
    // Ice White
    surface: Color(0xFFFFFFFF),
    // Soft Cloud
    surfaceElevated: Color(0xFFEDF1FB),
    // Lavender Mist
    border: Color(0xFFC8D3EF),
    // Periwinkle
    accent: Color(0xFF08519C),
    // Flutter Blue (same across themes)
    accentCyan: Color(0xFF306093),
    // Ocean Cyan (adjusted for light bg)
    accentPurple: Color(0xFF6D87A3),
    // Dart Purple (deeper for light bg)
    success: Color(0xFF00C48C),
    // Adjusted Mint
    warning: Color(0xFFFFB300),
    // Amber
    danger: Color(0xFFFF4757),
    // Coral Red
    textPrimary: Color(0xFF0D1B3E),
    // Midnight
    textSecondary: Color(0xFF4A5878),
    // Slate
    textMuted: Color(0xFFA0AECA),
    // Fog (light variant)
    textOnAccent: Color(0xFFFFFFFF), // Pure White
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color border;
  final Color accent;
  final Color accentCyan;
  final Color accentPurple;
  final Color success;
  final Color warning;
  final Color danger;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textOnAccent;

  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.border,
    required this.accent,
    required this.accentCyan,
    required this.accentPurple,
    required this.success,
    required this.warning,
    required this.danger,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textOnAccent,
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
    colors: [Color(0xFF1A2340), Color(0xFF0F1629)],
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
    Color? accentPurple,
    Color? success,
    Color? warning,
    Color? danger,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textOnAccent,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      accentCyan: accentCyan ?? this.accentCyan,
      accentPurple: accentPurple ?? this.accentPurple,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textOnAccent: textOnAccent ?? this.textOnAccent,
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
      accentCyan: Color.lerp(accentCyan, other.accentCyan, t)!,
      accentPurple: Color.lerp(accentPurple, other.accentPurple, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textOnAccent: Color.lerp(textOnAccent, other.textOnAccent, t)!,
    );
  }
}
