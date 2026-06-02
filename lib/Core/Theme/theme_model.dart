import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
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
      )
    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
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
      )
    ],
  );
}
