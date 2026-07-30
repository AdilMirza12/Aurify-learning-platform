import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'button_theme.dart';
import 'component_theme.dart';
import 'input_theme.dart';

/// Central theme configuration for the application.
abstract class AppTheme {
  AppTheme._();

  /// Light theme definition
  static ThemeData get lightTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: Colors.white,
      onSurface: AppColors.primaryDark,
      onSurfaceVariant: AppColors.neutral,
      outline: AppColors.neutralVariant,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      textTheme: _buildTextTheme(isDark: false),
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme(isDark: false),
      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme(isDark: false),
      textButtonTheme: AppButtonTheme.textButtonTheme(isDark: false),
      filledButtonTheme: AppButtonTheme.filledButtonTheme(isDark: false),
      iconButtonTheme: AppButtonTheme.iconButtonTheme(isDark: false),
      // floatingActionButtonTheme: AppButtonTheme.fabTheme(isDark: false),
      inputDecorationTheme: AppInputTheme.inputDecorationTheme(isDark: false),
      searchBarTheme: AppInputTheme.searchBarTheme(isDark: false),
      dropdownMenuTheme: AppInputTheme.dropdownMenuTheme(isDark: false),
      appBarTheme: AppComponentTheme.appBarTheme(isDark: false),
      cardTheme: AppComponentTheme.cardTheme(isDark: false),
      dialogTheme: AppComponentTheme.dialogTheme(isDark: false),
      bottomSheetTheme: AppComponentTheme.bottomSheetTheme(isDark: false),
      snackBarTheme: AppComponentTheme.snackBarTheme(isDark: false),
      chipTheme: AppComponentTheme.chipTheme(isDark: false),
      checkboxTheme: AppComponentTheme.checkboxTheme(isDark: false),
      radioTheme: AppComponentTheme.radioTheme(isDark: false),
      switchTheme: AppComponentTheme.switchTheme(isDark: false),
      dividerTheme: AppComponentTheme.dividerTheme(isDark: false),
      tabBarTheme: AppComponentTheme.tabBarTheme(isDark: false),
      bottomNavigationBarTheme: AppComponentTheme.bottomNavigationBarTheme(
        isDark: false,
      ),
      navigationBarTheme: AppComponentTheme.navigationBarTheme(isDark: false),
      drawerTheme: AppComponentTheme.drawerTheme(isDark: false),
      tooltipTheme: AppComponentTheme.tooltipTheme(isDark: false),
      progressIndicatorTheme: AppComponentTheme.progressIndicatorTheme(
        isDark: false,
      ),
      badgeTheme: AppComponentTheme.badgeTheme(isDark: false),
      listTileTheme: AppComponentTheme.listTileTheme(isDark: false),
      iconTheme: AppComponentTheme.iconTheme(isDark: false),
      primaryIconTheme: AppComponentTheme.primaryIconTheme(isDark: false),
      popupMenuTheme: AppComponentTheme.popupMenuTheme(isDark: false),
      expansionTileTheme: AppComponentTheme.expansionTileTheme(isDark: false),
      scrollbarTheme: AppComponentTheme.scrollbarTheme(isDark: false),
    );
  }

  /// Dark theme definition
  static ThemeData get darkTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      onSurfaceVariant: AppColors.onSurfaceVariant,
      outline: AppColors.neutralVariant,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.primaryDark,
      textTheme: _buildTextTheme(isDark: true),
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme(isDark: true),
      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme(isDark: true),
      textButtonTheme: AppButtonTheme.textButtonTheme(isDark: true),
      filledButtonTheme: AppButtonTheme.filledButtonTheme(isDark: true),
      iconButtonTheme: AppButtonTheme.iconButtonTheme(isDark: true),
      //floatingActionButtonTheme: AppButtonTheme.fabTheme(isDark: true),
      inputDecorationTheme: AppInputTheme.inputDecorationTheme(isDark: true),
      searchBarTheme: AppInputTheme.searchBarTheme(isDark: true),
      dropdownMenuTheme: AppInputTheme.dropdownMenuTheme(isDark: true),
      appBarTheme: AppComponentTheme.appBarTheme(isDark: true),
      cardTheme: AppComponentTheme.cardTheme(isDark: true),
      dialogTheme: AppComponentTheme.dialogTheme(isDark: true),
      bottomSheetTheme: AppComponentTheme.bottomSheetTheme(isDark: true),
      snackBarTheme: AppComponentTheme.snackBarTheme(isDark: true),
      chipTheme: AppComponentTheme.chipTheme(isDark: true),
      checkboxTheme: AppComponentTheme.checkboxTheme(isDark: true),
      radioTheme: AppComponentTheme.radioTheme(isDark: true),
      switchTheme: AppComponentTheme.switchTheme(isDark: true),
      dividerTheme: AppComponentTheme.dividerTheme(isDark: true),
      tabBarTheme: AppComponentTheme.tabBarTheme(isDark: true),
      bottomNavigationBarTheme: AppComponentTheme.bottomNavigationBarTheme(
        isDark: true,
      ),
      navigationBarTheme: AppComponentTheme.navigationBarTheme(isDark: true),
      drawerTheme: AppComponentTheme.drawerTheme(isDark: true),
      tooltipTheme: AppComponentTheme.tooltipTheme(isDark: true),
      progressIndicatorTheme: AppComponentTheme.progressIndicatorTheme(
        isDark: true,
      ),
      badgeTheme: AppComponentTheme.badgeTheme(isDark: true),
      listTileTheme: AppComponentTheme.listTileTheme(isDark: true),
      iconTheme: AppComponentTheme.iconTheme(isDark: true),
      primaryIconTheme: AppComponentTheme.primaryIconTheme(isDark: true),
      popupMenuTheme: AppComponentTheme.popupMenuTheme(isDark: true),
      expansionTileTheme: AppComponentTheme.expansionTileTheme(isDark: true),
      scrollbarTheme: AppComponentTheme.scrollbarTheme(isDark: true),
    );
  }

  /// Builds custom text typography for dark or light theme
  static TextTheme _buildTextTheme({required bool isDark}) {
    final baseColor = isDark ? AppColors.onSurface : AppColors.primaryDark;
    final secondaryColor = isDark
        ? AppColors.onSurfaceVariant
        : AppColors.neutral;

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: baseColor,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: baseColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: baseColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: baseColor,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: baseColor,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryColor,
        letterSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: baseColor,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        letterSpacing: 0.5,
      ),
    );
  }
}
