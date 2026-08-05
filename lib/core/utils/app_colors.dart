import 'package:flutter/material.dart';

/// Application color palette definition.
abstract class AppColors {
  AppColors._();

  // ============================================
  // PRIMARY COLORS
  // ============================================

  /// Main primary color (#0B1F45) - Deep Midnight Navy Blue
  static const Color primary = Color(0xFF0B1F45);

  /// Lighter variant of primary
  static const Color primaryLight = Color(0xFF1A366B);

  /// Darker variant of primary
  static const Color primaryDark = Color(0xFF06122B);

  /// Container color for primary elements
  static const Color primaryContainer = Color(0xFF122A59);

  /// Text/icon color on primary backgrounds
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Text/icon color on primary container
  static const Color onPrimaryContainer = Color(0xFFD0DDFA);

  // ============================================
  // SECONDARY COLORS
  // ============================================

  /// Secondary accent color (#D9531A) - Vibrant Burnt Orange
  static const Color secondary = Color(0xFFD9531A);

  /// Light secondary variant
  static const Color secondaryLight = Color(0xFFE8703D);

  /// Dark secondary variant
  static const Color secondaryDark = Color(0xFFB03E0E);

  /// Container for secondary elements
  static const Color secondaryContainer = Color(0xFF4D1C08);

  /// Text/icon color on secondary backgrounds
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Text/icon color on secondary container
  static const Color onSecondaryContainer = Color(0xFFFFDBCF);

  // ============================================
  // TERTIARY COLORS
  // ============================================

  /// Tertiary accent color (#C99A3D) - Warm Gold / Amber
  static const Color tertiary = Color(0xFFC99A3D);

  /// Light tertiary variant
  static const Color tertiaryLight = Color(0xFFDDB35A);

  /// Dark tertiary variant
  static const Color tertiaryDark = Color(0xFF9C7322);

  /// Container for tertiary elements
  static const Color tertiaryContainer = Color(0xFF443310);

  /// Text/icon color on tertiary backgrounds
  static const Color onTertiary = Color(0xFFFFFFFF);

  /// Text/icon color on tertiary container
  static const Color onTertiaryContainer = Color(0xFFFCE8C3);

  // ============================================
  // NEUTRAL COLORS
  // ============================================

  /// Main neutral color (#5B6478) - Slate Grey
  static const Color neutral = Color(0xFF5B6478);

  /// Light neutral variant
  static const Color neutralLight = Color(0xFF838C9E);

  /// Dark neutral variant
  static const Color neutralDark = Color(0xFF3A4150);

  /// Neutral variant for borders and dividers
  static const Color neutralVariant = Color(0xFF485061);

  // ============================================
  // SCAFFOLD & BACKGROUND COLORS
  // ============================================

  /// Main scaffold background color (Updated from 0xFF0C042E to #0B1F45)
  static const Color scaffoldBackground = Color(0xFF0B1F45);

  /// Light theme scaffold background
  static const Color scaffoldBackgroundLight = Color(0xFFF4F6F9);

  /// Dark theme scaffold background
  static const Color scaffoldBackgroundDark = Color(0xFF06122B);

  /// Surface / Card background color
  static const Color surface = Color(0xFF102854);

  /// Lighter surface color
  static const Color surfaceLight = Color(0xFF183870);

  /// Text/icon color on surface backgrounds
  static const Color onSurface = Color(0xFFFFFFFF);

  /// Secondary text color on surface backgrounds
  static const Color onSurfaceVariant = Color(0xFFA1ABB9);

  /// Primary text color getter / alias
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Secondary text color getter / alias
  static const Color textSecondary = Color(0xFFA1ABB9);

  /// Disabled text color getter / alias
  static const Color textDisabled = Color(0x61FFFFFF);

  /// Hint text color getter / alias
  static const Color textHint = Color(0x99A1ABB9);

  /// Outline color getter / alias
  static const Color outline = Color(0xFF485061);

  /// Status & utility colors
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);
  static const Color warning = Color(0xFFED6C02);
  static const Color info = Color(0xFF0288D1);

  /// Additional ColorScheme variant & system colors
  static const Color surfaceVariant = Color(0xFF183870);
  static const Color outlineVariant = Color(0xFF3A4150);
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color inverseSurface = Color(0xFFE2E2E6);
  static const Color inverseOnSurface = Color(0xFF1B1B1F);
  
  /// Custom Background Colors
  static const Color beige = Color(0xFFF3EFE9);

  // ============================================
  // SHIMMER & ANIMATION COLORS
  // ============================================
  static const Color shimmerBase = Color(0xFF163268);
  static const Color shimmerHighlight = Color(0xFF244B93);

  // ============================================
  // GRADIENTS
  // ============================================

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0B1F45), Color(0xFF1A366B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFD9531A), Color(0xFFC99A3D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
