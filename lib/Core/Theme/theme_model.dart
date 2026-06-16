import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xffF8FAFC),
        surface: Color(0xffefefef),
        card: Color(0xffFFFFFF),
        accent: Color(0xff2E5077),
        secondary: Color(0xff5965b8),
        success: Color(0xFF05B367),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
        text1: Color(0xff1a2e45),
        text2: Color(0xff5e6265),
        text3: Color(0xff9AA6B2),
      )
    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xff0F1923),  // navy داكن جداً — مش أسود
        surface:    Color(0xff1A2535),  // أفتح شوية
        card:       Color(0xff1E2D40),  // أفتح من الـ surface يتميز

        accent:     Color(0xff4A90C4),  // الـ navy اتفتح — يبان على الداكن
        secondary:  Color(0xff7B84D4),  // الـ secondary اتفتح كمان

        success:    Color(0xFF05B367),  // ✅ نفسه — شغال على الداكن
        warning:    Color(0xFFFFB300),  // ✅ نفسه
        danger:     Color(0xFFFF4757),  // ✅ نفسه

        text1:      Color(0xffE8F0F7),
        text2:      Color(0xff9AACBC),
        text3:      Color(0xff4A5F72),
      )
    ],
  );
}
