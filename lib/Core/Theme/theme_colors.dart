import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xff0F1923),  // navy داكن جداً — مش أسود
    surface:    Color(0xff1A2535),  // أفتح شوية
    card:       Color(0xff1E2D40),  // أفتح من الـ surface يتميز

    accent:     Color(0xff4A90C4),  // الـ navy اتفتح — يبان على الداكن
    secondary:  Color(0xff7B84D4),  // الـ secondary اتفتح كمان

    success:    Color(0xFF05B367),  // ✅ نفسه — شغال على الداكن
    warning:    Color(0xFFFFB300),  // ✅ نفسه
    danger:     Color(0xFFFF4757),  // ✅ نفسه

    text1:      Color(0xffE8F0F7),  // مش أبيض خالص
    text2:      Color(0xff9AACBC),  // معكوس الـ text2 اللايت
    text3:      Color(0xff4A5F72),
  );


  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xffF8FAFC),
    surface: Color(0xffefefef),
    card: Color(0xffFFFFFF),
    accent: Color(0xff2E5077),
    secondary: Color(0xff5965b8),
    success: Color(0xFF05B367),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    text1: Color(0xff142335),
    text2: Color(0xff3d4042),
    text3: Color(0xff9AA6B2),
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color card;
  final Color text3;
  final Color accent;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;

  const AppColors({
    required this.background,
    required this.surface,
    required this.card,
    required this.text3,
    required this.accent,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.danger,
    required this.text1,
    required this.text2,
  });

  // Badge colours
  static const appBadgeBg      = Color(0xFFE8F4ED);
  static const appBadgeText    = Color(0xFF2D7A4F);
  static const webBadgeBg      = Color(0xFFE8EEFA);
  static const webBadgeText    = Color(0xFF2D4FA0);
  static const ecommBadgeBg    = Color(0xFFFAF0E8);
  static const ecommBadgeText  = Color(0xFFA06020);
  static const healthBadgeBg   = Color(0xFFFAE8EE);
  static const healthBadgeText = Color(0xFFA0203A);

  // ─── Gradient Helpers ─────────────────────────────────────────────────────

  /// Subtle card depth (dark theme only)
  static const gradientCardDark = LinearGradient(
    colors: [
       Color(0xFF0F1715),
     Color(0xFF17211E),
     Color(0xFF1E2A26),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientCardLight = LinearGradient(
    colors: [
       Color(0xFFFAF8F0),
       Color(0xFFFBF9E9),
     Color(0xffedece3),
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
    Color? textSecondary,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: surfaceElevated ?? this.card,
      text3: border ?? this.text3,
      accent: accent ?? this.accent,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: textPrimary ?? this.text1,
      text2: textSecondary ?? this.text2,
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
      text3: Color.lerp(text3, other.text3, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
    );
  }
}
