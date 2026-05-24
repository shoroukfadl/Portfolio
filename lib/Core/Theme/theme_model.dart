import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFFF7F5F0),
        surface: Color(0xffEEEAE2),
        surfaceElevated: Color(0xffFFFFFF),
        secondary: Color(0xffE9F5EE),
        accent: Color(0xff2D6A4F),
        accent2: Color(0xff74C69D),
        accentSoft: Color(0xffD8F3DC),
        success: Color(0xFF05B367),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
        text1: Color(0xff1C1C1A),
        text2: Color(0xff5A5955),
        text3: Color(0xff9A9892),
        secondaryEv: Color(0xff1B4332),
      )
    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFF131412),
        surface: Color(0xff1C1B18),
        surfaceElevated: Color(0xff242320),
        secondary: Color(0xff1B4332),
        accent: Color(0xff74C69D),
        accent2: Color(0xff52B788),
        accentSoft: Color(0xff1B4332),
        success: Color(0xFF05B367),
        warning: Color(0xFFFFB300),
        danger: Color(0xFFFF4757),
        text1: Color(0xFFF0EDE6),
        text2: Color(0xFFA8A49C),
        text3: Color(0xFF6A6660),
        secondaryEv: Color(0xff95D5B2),
      )
    ],
  );
}
