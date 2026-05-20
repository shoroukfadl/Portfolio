import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xfffdfcfc),
        surface: Color(0xffe4d8c0),
        surfaceElevated: Color(0xffe6e1d7),
        border: Color(0xff011825),
        secondary: Color(0xff780000),
        accent: Color(0xff003049),
        success: Color(0xFF05B367),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
        textPrimary: Color(0xff011825),
        textSecondary: Color(0xff669BBC),
        secondaryEv: Color(0xffc2121f),
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
        secondaryEv: Color(0xffc2121f),
      )
    ],
  );
}
