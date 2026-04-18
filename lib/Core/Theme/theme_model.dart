import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFFF8F9FD),
        // Ice White
        surface: Color(0xFFFFFFFF),
        // Soft Cloud
        surfaceElevated: Color(0xFFEDF1FB),
        // Lavender Mist
        border: Color(0xFFC8D3EF),
        // Periwinkle
        accent: Color(0xFF6366F1),
        // Flutter Blue (same across themes)
        secondary: Color(0xFF0EA5E9),
        // Ocean Cyan (adjusted for light bg)
        // Dart Purple (deeper for light bg)
        success: Color(0xFF00C48C),
        // Adjusted Mint
        warning: Color(0xFFFFB300),
        // Amber
        danger: Color(0xFFFF4757),
        // Coral Red
        textPrimary: Color(0xFF1F2937),
        // Midnight
        textSecondary: Color(0xFF4A5878),
        // Slate
        // Fog (light variant)
      )    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFF0F172A),
        // Void Black
        surface: Color(0xFF0F1629),
        // Deep Navy
        surfaceElevated: Color(0xFF1A2340),
        // Slate Blue
        border: Color(0xFF2A3555),
        // Steel
        accent: Color(0xFF818CF8),
        // Flutter Blue
        secondary: Color(0xFF38BDF8),
        // Electric Cyan
        success: Color(0xFF00E5A0),
        // Mint
        warning: Color(0xFFFFB300),
        // Amber
        danger: Color(0xFFFF4757),
        // Coral Red
        textPrimary: Color(0xFFF1F5F9),
        // Cloud White
        textSecondary: Color(0xFF7A8BB0),
        // Steel Grey
      )    ],
  );
}
