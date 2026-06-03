import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xFF0f1117),
    surface: Color(0xff161b27),
    card: Color(0xff1c2333),
    accent: Color(0xff3b82f6),
    accent50: Color(0xff61a5c2),
    accent25: Color(0xFFa9d6e5),
    secondary: Color(0xFF06b6d4),
    text1: Color(0xffc8d4e8),
    text2: Color(0xff8b9cbf),
    text3: Color(0xff64748b),
    border: Color(0xff2a3248),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
  );

  // Shared
  static const Color emerald = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF34D399);
  static const Color error = Color(0xFFDC2626);
  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xfff0f4fa),
    surface: Color(0xffffffff),
    card: Color(0xfffffff4),
    accent: Color(0xff2563eb),
    accent50: Color(0xff61a5c2),
    accent25: Color(0xFFa9d6e5),
    secondary: Color(0xFF06b6d4),
    text1: Color(0xff0f172a),
    text2: Color(0xff374151),
    text3: Color(0xffbcbcbc),
    border: Color(0xffe2e8f4),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    // Slate
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color card;
  final Color border;
  final Color accent;
  final Color accent50;
  final Color accent25;
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;
  final Color text3;
  final Color secondary;

  const AppColors({
    required this.background,
    required this.surface,
    required this.card,
    required this.border,
    required this.accent,
    required this.success,
    required this.warning,
    required this.danger,
    required this.text1,
    required this.text2,
    required this.accent50,
    required this.accent25,
    required this.text3,
    required this.secondary,
  });

  // ─── Gradient Helpers ─────────────────────────────────────────────────────
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
    Color? accent25,
    Color? fontColor3,
    Color? textSecondary,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: surfaceElevated ?? this.card,
      border: border ?? this.border,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: textPrimary ?? this.text1,
      text2: textSecondary ?? this.text2,
      accent25: accent25 ?? this.accent25,
      accent50: accent50 ?? this.accent50,
      text3: fontColor3 ?? this.text3,
      secondary: secondary ?? this.secondary,
    );
  }

  // ─── lerp ─────────────────────────────────────────────────────────────────
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
        background: Color.lerp(background, other.background, t)!,
        surface: Color.lerp(surface, other.surface, t)!,
        card: Color.lerp(card, other.card, t)!,
        border: Color.lerp(border, other.border, t)!,
        accent: Color.lerp(accent, other.accent, t)!,
        success: Color.lerp(success, other.success, t)!,
        warning: Color.lerp(warning, other.warning, t)!,
        danger: Color.lerp(danger, other.danger, t)!,
        text1: Color.lerp(text1, other.text1, t)!,
        text2: Color.lerp(text2, other.text2, t)!,
        accent50: Color.lerp(accent50, other.accent50, t)!,
        text3: Color.lerp(text3, other.text3, t)!,
        accent25: Color.lerp(accent25, other.accent25, t)!,
        secondary: Color.lerp(secondary, other.secondary, t)!);
  }
}
