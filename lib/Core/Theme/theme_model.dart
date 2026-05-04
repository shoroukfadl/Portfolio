import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xffE8E8E6),
        surface: Color(0xffADADAD),
        surfaceElevated: Color(0xffdcdada),
        border: Color(0xff636261),
        secondary: Color(0xff918D8A),
        accent: Color(0xff464243),
        success: Color(0xFF05B367),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
        textPrimary: Color(0xff636261),
        textSecondary: Color(0xffADADAD),
      )
    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xff0d1019),
        surface: Color(0xff000000),
        surfaceElevated: Color(0xff040303),
        border: Color(0xff636261),
        secondary: Color(0xff918D8A),
        accent: Color(0xff464243),
        success: Color(0xFF05B367),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
        textPrimary: Color(0xff636261),
        textSecondary: Color(0xffADADAD),
      )
    ],
  );
}
