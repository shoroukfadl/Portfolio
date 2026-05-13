import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
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
      )
    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
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
      )
    ],
  );
}
