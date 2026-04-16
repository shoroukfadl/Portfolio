import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFFF5F8FF),
        // Ice White
        surface: Color(0xFFFFFFFF),
        // Soft Cloud
        surfaceElevated: Color(0xFFEDF1FB),
        // Lavender Mist
        border: Color(0xFFC8D3EF),
        // Periwinkle
        accent: Color(0xFF027DFD),
        // Flutter Blue (same across themes)
        accentCyan: Color(0xFF0099CC),
        // Ocean Cyan (adjusted for light bg)
        accentPurple: Color(0xFF6200EE),
        // Dart Purple (deeper for light bg)
        success: Color(0xFF00C48C),
        // Adjusted Mint
        warning: Color(0xFFFFB300),
        // Amber
        danger: Color(0xFFFF4757),
        // Coral Red
        textPrimary: Color(0xFF0D1B3E),
        // Midnight
        textSecondary: Color(0xFF4A5878),
        // Slate
        textMuted: Color(0xFFA0AECA),
        // Fog (light variant)
        textOnAccent: Color(0xFFFFFFFF), // Pure White
      )
    ],
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    extensions: const [
      AppColors(
        background: Color(0xFF0A0E17),
        // Void Black
        surface: Color(0xFF0F1629),
        // Deep Navy
        surfaceElevated: Color(0xFF1A2340),
        // Slate Blue
        border: Color(0xFF2A3555),
        // Steel
        accent: Color(0xFF027DFD),
        // Flutter Blue
        accentCyan: Color(0xFF00D4FF),
        // Electric Cyan
        accentPurple: Color(0xFF7C4DFF),
        // Dart Purple
        success: Color(0xFF00E5A0),
        // Mint
        warning: Color(0xFFFFB300),
        // Amber
        danger: Color(0xFFFF4757),
        // Coral Red
        textPrimary: Color(0xFFE8EDF8),
        // Cloud White
        textSecondary: Color(0xFF7A8BB0),
        // Steel Grey
        textMuted: Color(0xFF3D4F72),
        // Fog
        textOnAccent: Color(0xFFFFFFFF), // Pure White (text on colored buttons)
      )
    ],
  );
}
