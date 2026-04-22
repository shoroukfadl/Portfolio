import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFFe7ecef),
        surface: Color(0xfff0f2f4),
        surfaceElevated: Color(0xFFEDF1FB),
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
      )    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
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
      )    ],
  );
}
