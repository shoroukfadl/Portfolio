import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xfff6fafa),
        surface: Color(0xffffffff),
        surfaceElevated: Color(0xffd6e2e9),
        secondary: Color(0xFFBC870C),
        accent: Color(0xff2c7da0),
        accent50: Color(0xff61a5c2),
        accent25: Color(0xFFa9d6e5),
        text1: Color(0xff012a4a),
        text2: Color(0xFF929293),
        text3: Color(0xffbcbcbc),
        border: Color(0xFF0B2950),
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
        background: Color(0xff021422),
        surface: Color(0xff011729),
        surfaceElevated: Color(0xff012a4a),
        secondary: Color(0xFFBC870C),
        accent: Color(0xff2c7da0),
        accent50: Color(0xff61a5c2),
        accent25: Color(0xFFa9d6e5),
        text1: Color(0xfff6fafa),
        text2: Color(0xffd6e2e9),
        text3: Color(0xffbcbcbc),
        border: Color(0xffd6e2e9),
        success: Color(0xFF00C48C),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
      )
    ],
  );
}
